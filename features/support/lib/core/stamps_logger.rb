module Stamps
  class StampsLogger
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

    def repeat char, count
      str=char
      count.to_i.times {str=str+char}
      str
    end

    def scenario_name=name
      @test_name = name
    end

    def message message
      begin
        message = repeat message, 40 if message.size==1
        @logger.info "#{@test_name} :: #{message}"
      rescue
        # ignore
      end
      message
    end

    def step message
      begin
        (@logger.info "#{@test_name} :: #{message}")
      rescue
        # ignore
      end
      message
    end

    def info message
      begin
        message = repeat message, 40 if message.size==1
        (@logger.info "#{@test_name} :: #{message}") if TestHelper.verbose
      rescue
        # ignore
      end
      message
    end

    def warn message
      begin
        (@logger.warn "#{@test_name} :: #{message}") if TestHelper.verbose
      rescue
        # ignore
      end
      message
    end

    def error message
      begin
        (@logger.error "#{@test_name} :: #{message}") if TestHelper.verbose
      rescue
        # ignore
      end
      message
    end

    def fatal message
      begin
        (@logger.fatal "#{@test_name} :: #{message}") if TestHelper.verbose
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

