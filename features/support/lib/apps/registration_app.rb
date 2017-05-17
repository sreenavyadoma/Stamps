
module RegistrationApp
  def registration
    begin
      @registration ||= Stamps::Registration::WebRegistration.new(modal_param)
    rescue Exception => e
      config.logger.error e.message
      config.logger.error e.backtrace.join("\n")
    end
  end

  def sdc_website
    begin
      @sdc_website ||= Stamps::Registration::SdcWebsite.new(modal_param)
    rescue Exception => e
      config.logger.error e.message
      config.logger.error e.backtrace.join("\n")
    end
  end

  def registration_parameter_file(*args)
    directory = "#{data_for(:registration, {})['development_dir']}"
    directory = "#{data_for(:registration, {})['jenkins_dir']}" if helper.to_bool(ENV['JENKINS'])
    FileUtils.mkdir_p(directory)
    return "#{directory}\\#{ENV['URL']}_#{(args.length==0||args[0].nil?)?data_for(:registration, {})['default_parameter_file']:"#{args[0]}"}.yml" if helper.to_bool(ENV['JENKINS'])
    "#{directory}\\#{ENV['URL']}_#{(args.length==0||args[0].nil?)?data_for(:registration, {})['default_parameter_file']:"#{args[0]}"}.yml"
  end

  def registration_data_store_file(*args)
    directory = "#{data_for(:registration, {})['jenkins_dir']}"
    FileUtils.mkdir_p(directory)
    "#{directory}\\#{ENV['URL']}_#{(args.length==0||args[0].nil?)?data_for(:registration, {})['default_data_store_file']:"#{args[0]}"}.txt"
  end

  def reg_yml_data_file(*args)
    @reg_yml_data_file ||= args[0] if args.length>0
    @reg_yml_data_file
  end
end