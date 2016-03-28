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
      @logger.level = Log4r::DEBUG
    end

    def scenario_name=name
      @test_name = name
    end

    def message message
      @logger ||= init_info
      begin
        @logger.info "#{@test_name} :: #{message}"
      rescue
        # ignore
      end
      message
    end

    def info message
      @logger ||= init_info
      begin
        (@logger.info "#{@test_name} :: #{message}") if Stamps::Test.verbose
      rescue
        # ignore
      end
      message
    end

    def debug message
      @logger ||= init_debug
      begin
        @logger.debug "#{@test_name} :: #{message}" if Stamps::Test.verbose
      rescue
        #ignroe
      end
      message
    end
  end
end

