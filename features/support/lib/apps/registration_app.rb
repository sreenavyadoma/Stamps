
module RegistrationApp
  def registration
    begin
      @registration ||= Stamps::Registration::WebRegistration.new(modal_param)
    rescue Exception => e
      config.logger.error e.message
      config.logger.error e.backtrace.join("\n")
    end
  end

  def registration=registration
    @registration ||= registration
  end

  def sdc_website
    begin
      @sdc_website ||= Stamps::Registration::SdcWebsite.new(modal_param)
    rescue Exception => e
      config.logger.error e.message
      config.logger.error e.backtrace.join("\n")
    end
  end

  def pam
    @pam ||= Pam::PaymentAdministratorManager.new(modal_param)
  end

  def registration_user_modal_parameter_file(*args)
    begin
      if helper.to_bool(ENV['JENKINS'])
        filename = "#{data_for(:registration, {})['registration_modal_param_dir']}\\#{ENV['URL']}_#{(args.length==0)?"Registration":"#{args[0]}"}.yml"
      else
        filename = "#{data_for(:registration, {})['dev_usr_dir']}\\#{ENV['URL']}_#{(args.length==0)?"Registration":"#{args[0]}"}.yml"
      end
      config.logger.message "Registration modal_parameter file: #{filename}"
      filename
    rescue Exception => e
      p e.message
      p e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data from default.yml. Check your format?").to eql e.message
    end
  end

  def registration_data_store_filename(*args)
    begin
      "#{data_for(:registration, {})['registration_data_store_dir']}\\#{ENV['URL']}_#{(args.length==0)?"Registration":"#{args[0]}"}.txt"
    rescue Exception => e
      p e.message
      p e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data. Check your format?").to eql e.message
    end
  end
end