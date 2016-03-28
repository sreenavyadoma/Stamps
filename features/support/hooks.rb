# encoding: utf-8
include Stamps
include Stamps::Browser
include Orders
include Print
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation


@shipping_method_map ||= Hash.new
@shipping_method_map['USPS First-Class Mail Letter'] = "807"
@shipping_method_map['USPS First-Class Mail Large Envelope'] = "806"
@shipping_method_map['USPS First-Class Mail Package'] = "805"
@shipping_method_map['USPS Priority Mail Flat Rate Envelope'] = "809"
@shipping_method_map['USPS Priority Mail Small Flat Rate Box'] = "810"
@shipping_method_map['USPS Media Mail'] = "802"
@shipping_method_map['USPS Priority Mail Medium Flat Rate Box'] = "811"
@shipping_method_map['USPS Priority Mail International Small Flat Rate Box'] = "824"
@shipping_method_map['USPS Priority Mail International Flat Rate Envelope'] = "823"
@shipping_method_map['USPS Priority Mail Large Flat Rate Box'] = "812"
@shipping_method_map['USPS Priority Mail Express Flat Rate Envelope'] = "814"
@shipping_method_map['USPS RAJ SHIPPING'] = "804"
@shipping_method_map['USPS Priority Mail Express International Flat Rate Envelope'] = "828"
@shipping_method_map['USPS Priority Mail'] = "808"
@shipping_method_map['USPS Priority Mail International Medium Flat Rate Box'] = "825"
@shipping_method_map['USPS Priority Mail International'] = "822"
@shipping_method_map['USPS Priority Mail Express'] = "813"
@shipping_method_map['USPS Priority Mail International Large Flat Rate Box'] = "826"
@shipping_method_map['USPS First-Class Mail International Large Envelope'] = "820"
@shipping_method_map['USPS First-Class Package International Service'] = "821"
@shipping_method_map['USPS Priority Mail Express International'] = "827"

Before do  |scenario|
  @scenario_name = scenario.name
  Test.scenario_name = @scenario_name
  log.info "Begin Test Scenario:  -----------------------------------------  "
  log.info "Begin Test Scenario:  -----------------------------------------  "
  log.info "Begin Test Scenario:  -----------------------------------------  "
end

After do |scenario|
  Stamps::Test.teardown
  $start = false
  log.info "End Test Scenario:  -------------------------------------------  "
  log.info "End Test Scenario:  -------------------------------------------  "
  log.info "End Test Scenario:  -------------------------------------------  "
end




# Ruby read-write lock implementation
# Allows any number of concurrent readers, but only one concurrent writer
# (And if the "write" lock is taken, any readers who come along will have to wait)

# If readers are already active when a writer comes along, the writer will wait for
#   all the readers to finish before going ahead
# But any additional readers who come when the writer is already waiting, will also
#   wait (so writers are not starved)

# Written by Alex Dowad
# Bug fixes contributed by Alex Kliuchnikau
# Suggestion on avoiding reader starvation contributed by maniek
# Thanks to Doug Lea for java.util.concurrent.ReentrantReadWriteLock (used for inspiration)

# Usage:
# lock = ReadWriteLock.new
# lock.with_read_lock  { data.retrieve }
# lock.with_write_lock { data.modify! }

# NOTE: DON'T try to acquire the write lock while already holding a read lock!
# OR try to acquire the write lock while you already have it
# It will lead to deadlock

# Implementation notes:
# A goal is to make the uncontended path for both readers/writers lock-free
# Only if there is reader-writer or writer-writer contention, should locks be used
# Internal state is represented by a single integer ("counter"), and updated
#  using atomic compare-and-swap operations
# When the counter is 0, the lock is free
# Each reader increments the counter by 1 when acquiring a read lock
#   (and decrements by 1 when releasing the read lock)
# The counter is increased by (1 << 15) for each writer waiting to acquire the
#   write lock, and by (1 << 30) if the write lock is taken
=begin
class ReadWriteLock
  def initialize
    @counter      = Atomic.new(0)         # single integer which represents lock state
    @reader_q     = ConditionVariable.new # queue for waiting readers
    @reader_mutex = Mutex.new             # to protect reader queue
    @writer_q     = ConditionVariable.new # queue for waiting writers
    @writer_mutex = Mutex.new             # to protect writer queue
  end

  WAITING_WRITER  = 1 << 15
  RUNNING_WRITER  = 1 << 30
  MAX_READERS     = WAITING_WRITER - 1
  MAX_WRITERS     = RUNNING_WRITER - MAX_READERS - 1

  def with_read_lock
    acquire_read_lock
    result = yield
    release_read_lock
    result
  end

  def with_write_lock
    acquire_write_lock
    result = yield
    release_write_lock
    result
  end

  def acquire_read_lock
    while(true)
      c = @counter.value
      raise "Too many reader threads!" if (c & MAX_READERS) == MAX_READERS

      # If a writer is waiting when we first queue up, we need to wait
      if c >= WAITING_WRITER
        # But it is possible that the writer could finish and decrement @counter right here...
        @reader_mutex.synchronize do
          # So check again inside the synchronized section
          @reader_q.wait(@reader_mutex) if @counter.value >= WAITING_WRITER
        end

        # after a reader has waited once, they are allowed to "barge" ahead of waiting writers
        # but if a writer is *running*, the reader still needs to wait (naturally)
        while(true)
          c = @counter.value
          if c >= RUNNING_WRITER
            @reader_mutex.synchronize do
              @reader_q.wait(@reader_mutex) if @counter.value >= RUNNING_WRITER
            end
          else
            return if @counter.compare_and_swap(c,c+1)
          end
        end
      else
        break if @counter.compare_and_swap(c,c+1)
      end
    end
  end

  def release_read_lock
    while(true)
      c = @counter.value
      if @counter.compare_and_swap(c,c-1)
        # If one or more writers were waiting, and we were the last reader, wake a writer up
        if c >= WAITING_WRITER && (c & MAX_READERS) == 1
          @writer_mutex.synchronize { @writer_q.signal }
        end
        break
      end
    end
  end

  def acquire_write_lock
    while(true)
      c = @counter.value
      raise "Too many writers!" if (c & MAX_WRITERS) == MAX_WRITERS

      if c == 0 # no readers OR writers running
        # if we successfully swap the RUNNING_WRITER bit on, then we can go ahead
        break if @counter.compare_and_swap(0,RUNNING_WRITER)
      elsif @counter.compare_and_swap(c,c+WAITING_WRITER)
        while(true)
          # Now we have successfully incremented, so no more readers will be able to increment
          #   (they will wait instead)
          # However, readers OR writers could decrement right here, OR another writer could increment
          @writer_mutex.synchronize do
            # So we have to do another check inside the synchronized section
            # If a writer OR reader is running, then go to sleep
            c = @counter.value
            @writer_q.wait(@writer_mutex) if (c >= RUNNING_WRITER) || ((c & MAX_READERS) > 0)
          end

          # We just came out of a wait
          # If we successfully turn the RUNNING_WRITER bit on with an atomic swap,
          # Then we are OK to stop waiting and go ahead
          # Otherwise go back and wait again
          c = @counter.value
          break if (c < RUNNING_WRITER) &&
              ((c & MAX_READERS) == 0) &&
              @counter.compare_and_swap(c,c+RUNNING_WRITER-WAITING_WRITER)
        end
        break
      end
    end
  end

  def release_write_lock
    while(true)
      c = @counter.value
      if @counter.compare_and_swap(c,c-RUNNING_WRITER)
        @reader_mutex.synchronize { @reader_q.broadcast }
        if (c & MAX_WRITERS) > 0 # if any writers are waiting...
          @writer_mutex.synchronize { @writer_q.signal }
        end
        break
      end
    end
  end

  def to_s
    c = @counter.value
    s = if c >= RUNNING_WRITER
          "1 writer running, "
        elsif (c & MAX_READERS) > 0
          "#{c & MAX_READERS} readers running, "
        else
          ""
        end

    "#<ReadWriteLock:#{object_id.to_s(16)} #{s}#{(c & MAX_WRITERS) / WAITING_WRITER} writers waiting>"
  end
end

if __FILE__ == $0

  require 'benchmark'

  TOTAL_THREADS = 100 # set as high as practicable, for a better test

# if -i command line option is used, print a 'r' or 'w' each time a reader or writer
#   runs, so we can see whether either readers or writers are being starved
  $show_interleave = ARGV.include? "-i"

# if -c command line option is used, compare with other implementations
  $compare = ARGV.include? "-c"

  $jruby = defined?(RUBY_ENGINE) && RUBY_ENGINE == "jruby"

# for performance comparison with ReadWriteLock
  class SimpleMutex
    def initialize; @mutex = Mutex.new; end
    def with_read_lock
      @mutex.synchronize { yield }
    end
    alias :with_write_lock :with_read_lock
  end

# for seeing whether my correctness test is doing anything...
# and for seeing how great the overhead of the test is
# (apart from the cost of locking)
  class FreeAndEasy
    def with_read_lock
      yield # thread safety is for the birds... I prefer to live dangerously
    end
    alias :with_write_lock :with_read_lock
  end

  if $jruby
    # the Java platform comes with a read-write lock implementation
    # performance is very close to ReadWriteLock, but just a *bit* slower
    require 'java'
    class JavaReadWriteLock
      def initialize
        @lock = java.util.concurrent.locks.ReentrantReadWriteLock.new
      end
      def with_read_lock
        @lock.read_lock.lock
        result = yield
        @lock.read_lock.unlock
        result
      end
      def with_write_lock
        @lock.write_lock.lock
        result = yield
        @lock.write_lock.unlock
        result
      end
    end
  end

  def test(lock)
    puts "READ INTENSIVE (80% read, 20% write):"
    single_test(lock, (TOTAL_THREADS * 0.8).floor, (TOTAL_THREADS * 0.2).floor)
    puts "WRITE INTENSIVE (80% write, 20% read):"
    single_test(lock, (TOTAL_THREADS * 0.2).floor, (TOTAL_THREADS * 0.8).floor)
    puts "BALANCED (50% read, 50% write):"
    single_test(lock, (TOTAL_THREADS * 0.5).floor, (TOTAL_THREADS * 0.5).floor)
  end

  def single_test(lock, n_readers, n_writers, reader_iterations=50, writer_iterations=50, reader_sleep=0.001, writer_sleep=0.001)
    puts "Testing #{lock.class} with #{n_readers} readers and #{n_writers} writers. Readers iterate #{reader_iterations} times, sleeping #{reader_sleep}s each time, writers iterate #{writer_iterations} times, sleeping #{writer_sleep}s each time"
    mutex = Mutex.new
    bad   = false
    data  = 0

    result = Benchmark.measure do
      readers = n_readers.times.collect do
        Thread.new do
          reader_iterations.times do
            lock.with_read_lock do
              print "r" if $show_interleave
              mutex.synchronize { bad = true } if (data % 2) != 0
              sleep(reader_sleep)
              mutex.synchronize { bad = true } if (data % 2) != 0
            end
          end
        end
      end
      writers = n_writers.times.collect do
        Thread.new do
          writer_iterations.times do
            lock.with_write_lock do
              print "w" if $show_interleave
              # invariant: other threads should NEVER see "data" as an odd number
              value = (data += 1)
              # if a reader runs right now, this invariant will be violated
              sleep(writer_sleep)
              # this looks like a strange way to increment twice;
              # it's designed so that if 2 writers run at the same time, at least
              #   one increment will be lost, and we can detect that at the end
              data  = value+1
            end
          end
        end
      end

      readers.each { |t| t.join }
      writers.each { |t| t.join }
      puts "BAD!!! Readers+writers overlapped!" if mutex.synchronize { bad }
      puts "BAD!!! Writers overlapped!" if data != (n_writers * writer_iterations * 2)
    end
    puts result
  end

  test(ReadWriteLock.new)
  test(JavaReadWriteLock.new) if $compare && $jruby
  test(SimpleMutex.new) if $compare
  test(FreeAndEasy.new) if $compare
end

lock = ReadWriteLock.new
yourfile = "C:\\ruby\\qacc_credentials.txt"
File.open(yourfile, 'w') { |file|
  lock.with_write_lock { file.write("your text")  }

}

#lock.with_read_lock  { data.retrieve }
#lock.with_write_lock { data.modify! }

=end

=begin

@db_host  = "127.0.0.1"
@db_user  = "rob"
@db_pass  = "robken1018"
@db_name = "stamps"


con = Mysql.new @db_host, @db_user, @db_pass, @db_name

rs = con.query("SELECT * FROM user_credentials")
n_rows = rs.num_rows
n_rows.times do
  puts rs.fetch_row.join("\s")
end

rs = con.query('select * from user_credentials')
rs.each_hash { |h| puts h['name']}

con.close

#client = Mysql::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)
#@cdr_result = client.query "SELECT * from user_credentials"


=end