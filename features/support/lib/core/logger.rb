module Stamps
  class Logger
    def initialize *args
      case args.length
        when 0
          @test_name = ""
        when 1
          @test_name = args[0]
      end
      @logger ||= Log4r::Logger.new ":"
      @logger.outputters = Outputter.stdout
      #@logger.level = Log4r::INFO
    end

    def scenario_name=name
      @test_name = name
    end

    def message message
      begin
        @logger.info "#{@test_name} :: #{message}"
      rescue
        # ignore
      end
      message
    end

    def info message
      begin
        (@logger.info "#{@test_name} :: #{message}") if Stamps::Test.verbose
      rescue
        # ignore
      end
      message
    end

    def warn message
      begin
        (@logger.warn "#{@test_name} :: #{message}") if Stamps::Test.verbose
      rescue
        # ignore
      end
      message
    end

    def error message
      begin
        (@logger.error "#{@test_name} :: #{message}") if Stamps::Test.verbose
      rescue
        # ignore
      end
      message
    end

    def fatal message
      begin
        (@logger.fatal "#{@test_name} :: #{message}") if Stamps::Test.verbose
      rescue
        # ignore
      end
      message
    end

    def debug message
      begin
        @logger.debug "#{@test_name} :: #{message}"
      rescue
        #ignroe
      end
      message
    end
  end
end

