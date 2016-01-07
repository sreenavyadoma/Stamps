module Stamps
  class Logger
    private 
    def init_info
      logger ||= Log4r::Logger.new ":"
      logger.outputters = Outputter.stdout
      logger.level = Log4r::DEBUG
      logger
    end

    def init_debug
      logger ||= Log4r::Logger.new ":"
      logger.outputters = Outputter.stdout
      logger.level = Log4r::DEBUG
      logger
    end

    public

    def info message
      @logger_info ||= init_info
      begin
        (@logger_info.info message) if Stamps::Test.verbose
      rescue
        # ignore
      end
      message
    end

    def debug message
      @logger_debug ||= init_debug
      begin
        @logger_debug.debug message if Stamps::Test.verbose
      rescue
        #ignroe
      end
      message
    end

    def hash_param table
      table.each{|key, value| info "## #{key} :: #{value}"}
      table
    end

    def param param_name, value
      info "## #{param_name} :: #{value}"
      value
    end

    def field_tag field
      begin
        if field.include? 'Watir::'
          arr = field.to_s.split(":")
          return "#{arr[0].split('<')[1]}.#{arr[2]}" if arr.size > 2
        end
      rescue
        #ignore
      end
      field
    end

    def browser_field_set field, text, field_name
      info "Browser.#{log.field_tag(field.to_s)}.#{field_name}.set  \"#{text}\""
      text
    end

    def browser_field *args
      #field, text, field_name
      case args.length
        when 2
          info "Browser.#{log.field_tag(args[0].to_s)}.get \"#{args[1]}\""
        when 3
          info "Browser.#{log.field_tag(args[0].to_s)}.#{args[2]}.get \"#{args[1]}\""
        else
          raise "Wrong number of arguments"
      end
      args[1]
    end

    def browser_field_click *args
      case args.length
        when 1
          info "Browser.#{log.field_tag(args[0].to_s)}.click"
        when 2
          info "Browser.#{log.field_tag(args[0].to_s)}.#{args[1].to_s}.click"
        else
          raise "Wrong number of arguments"
      end
    end

    def log_attribute_get *args
      case args.length
        when 1
          info "Browser.#{log.field_tag(args[0].to_s)}.attribute.get"
        when 2
          info "Browser.#{log.field_tag(args[0].to_s)}.#{args[1].to_s}.get"
        when 3
          info "Browser.#{log.field_tag(args[0].to_s)}.#{args[1].to_s}.get result={#{args[2].to_s}}"
        else
          raise "Wrong number of arguments"
      end
    end

    def log_browser_present field, text, field_name
      info "Browser.#{log.field_tag(field.to_s)}.#{field_name}.present? \"#{text}\""
      text
    end

    def log_expectation field, expected, actual, result
      info "EXPECTATION :: #{field}:  #{expected}, Actual:  #{actual} # #{(result)?"Passed":"Failed"}"
    end

    def log_expectation_eql field, expected, actual
      info "EXPECTATION :: #{field}:  #{expected}, Actual:  #{actual} # #{actual.eql?(expected)?"Passed":"Failed"}"
    end
  end

  def log
    @logger ||= Stamps::Logger.new
  end
end

