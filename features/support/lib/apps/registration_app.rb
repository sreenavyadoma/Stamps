module Stamps
  module RegistrationApp
    def registration
      begin
        @registration ||= Stamps::Registration::WebRegistration.new(SdcTest.legacy_web_apps_param)
      rescue StandardError => e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join("\n")
        raise e
      end
    end

    def sdc_website
      begin
        @sdc_website ||= Stamps::Registration::SdcWebsite.new(SdcTest.legacy_web_apps_param)
      rescue StandardError => e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join("\n")
        raise e
      end
    end

    def registration_parameter_file(*args)
      directory="#{data_for(:registration, {})['development_dir']}"
      directory="#{data_for(:registration, {})['jenkins_dir']}" if TestHelper.to_bool(ENV['JENKINS']) #this is wrong.
      FileUtils.mkdir_p(directory)

      return "#{directory}\\#{ENV['URL']}_#{(args.length==0||args[0].nil?)?data_for(:registration, {})['default_parameter_file']:"#{args[0]}"}.yml" if TestHelper.to_bool(ENV['JENKINS']) #this is wrong., don't call environment variables this way.

      "#{directory}\\#{ENV['URL']}_#{(args.length==0||args[0].nil?)?data_for(:registration, {})['default_parameter_file']:"#{args[0]}"}.yml"
    end

    def registration_data_store_file(*args)
      directory="#{data_for(:registration, {})['jenkins_dir']}"
      FileUtils.mkdir_p(directory)
      "#{directory}\\#{ENV['URL']}_#{(args.length==0||args[0].nil?)?data_for(:registration, {})['default_data_store_file']:"#{args[0]}"}.txt"
    end

    def reg_yml_data_file(*args)
      @reg_yml_data_file ||= args[0] if args.length>0
      @reg_yml_data_file
    end
  end
end