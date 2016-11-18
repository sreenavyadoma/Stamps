module Stamps

  def init scenario
    begin
      TestHelper.init scenario
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def teardown
    begin
      TestHelper.teardown
    rescue
      #ignore
    end
  end

  def health
    begin
      HealthCheck.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def stamps
    begin
      @stamps ||= StampsCom.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def webreg
    begin
      @webreg ||= WebReg::WebRegistration.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def webreg_usr_filename
    begin
      begin
        if ParameterHelper.to_bool(ENV['JENKINS'])
          @webreg_usr_filename ||= "#{data_for(:webreg, {})['jenkins_usr_dir']}\\#{ENV['URL']}_webreg.yml"
        else
          @webreg_usr_filename ||= "#{data_for(:webreg, {})['dev_usr_dir']}\\#{ENV['URL']}_webreg.yml"
        end
        logger.message "WebReg parameter file: #{@filename}"        
      end if @webreg_usr_filename.nil?
      @webreg_usr_filename
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      "MagicData: Problem retrieving data from default.yml. Check your format?".should eql e.message
    end
  end

  def webreg_data_filename
    begin
      @webreg_data_filename ||= "#{data_for(:webreg, {})['webreg_usr_list_dir']}\\#{ENV['URL']}_webreg.txt"
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      "MagicData: Problem retrieving data from default.yml. Check your format?".should eql e.message
    end
  end

  def webreg_pam_data_filename
    begin
      @webreg_pam_data_filename ||= "#{data_for(:webreg, {})['webreg_usr_list_dir']}\\#{ENV['URL']}_webreg_pam.txt"
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      "MagicData: Problem retrieving data from default.yml. Check your format?".should eql e.message
    end
  end

  def webreg_pam_ord_data_filename
    begin
      @webreg_pam_ord_data_filename ||= "#{data_for(:webreg, {})['webreg_usr_list_dir']}\\#{ENV['URL']}_webreg_pam_ord.txt"
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      "MagicData: Problem retrieving data from default.yml. Check your format?".should eql e.message
    end
  end

  def pam
    begin
      @pam ||= Pam::PaymentAdministratorManager.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def volusion
    begin
      @volusion ||= Stores::VolusionLoginPage.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def param
    @param ||= ModalParam.new
    @param.browser = test_helper.browser
    @param.logger = test_helper.logger
    @param.scenario_name = test_helper.scenario_name
    @param
  end

  def test_data
    @test_data
  end

  def test_helper
    begin
      TestHelper
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def logger
    test_helper.logger
  end

  def browser
    test_helper.browser
  end
end
