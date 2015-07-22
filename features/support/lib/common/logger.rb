module Stamps
  private
  def log_init
    logger = Log4r::Logger.new ":"
    logger.outputters = Outputter.stdout
    logger.level = Log4r::INFO
    logger
  end

  public
  def self.logger
    @logger ||= log_init
  end

  def log_debug(message)
    Stamps.logger.debug caller[0] + message
  end

  def log(message)
    begin
      Stamps.logger.info message
    rescue
      # ignore
    end
    message
  end

  def log_hash_param(table)
    table.each{|key, value| log "## #{key} :: #{value}"}
    table
  end

  def log_param(param_name, value)
    log "## #{param_name} :: #{value}"
    value
  end

  def field_log_tag(field)
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

  def log_step(step)
    log "###########################################  ::  STEP  ::  #{step}  ::"
  end

  def log_browser_set(field, text, field_name)
    log "Browser.#{field_log_tag(field.to_s)}.#{field_name}.set  \"#{text}\""
    text
  end

  def log_browser_get(*args)
    #field, text, field_name
    case args.length
      when 2
        log "Browser.#{field_log_tag(args[0].to_s)}.get \"#{args[1]}\""
      when 3
        log "Browser.#{field_log_tag(args[0].to_s)}.#{args[2]}.get \"#{args[1]}\""
      else
        raise "Wrong number of arguments"
    end
    args[1]
  end

  def log_browser_click(*args)
    case args.length
      when 1
        log "Browser.#{field_log_tag(args[0].to_s)}.click"
      when 2
        log "Browser.#{field_log_tag(args[0].to_s)}.#{args[1].to_s}.click"
      else
        raise "Wrong number of arguments"
    end
  end

  def log_attribute_get (*args)
    case args.length
      when 1
        log "Browser.#{field_log_tag(args[0].to_s)}.attribute.get"
      when 2
        log "Browser.#{field_log_tag(args[0].to_s)}.#{args[1].to_s}.get"
      when 3
        log "Browser.#{field_log_tag(args[0].to_s)}.#{args[1].to_s}.get #{args[2].to_s}"
      else
        raise "Wrong number of arguments"
    end
  end

  def log_browser_present(field, text, field_name)
    log "Browser.#{field_log_tag(field.to_s)}.#{field_name}.present? \"#{text}\""
    text
  end


  def log_expectation(field, expected, actual, result)
    log "EXPECTATION :: #{field}:  #{expected}, Actual:  #{actual} # #{(result)?"Passed":"Failed"}"
  end

  def log_expectation_eql(field, expected, actual)
    log "EXPECTATION :: #{field}:  #{expected}, Actual:  #{actual} # #{actual.eql?(expected)?"Passed":"Failed"}"
  end
end

