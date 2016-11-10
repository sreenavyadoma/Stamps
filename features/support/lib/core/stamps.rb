module Stamps

  extend self

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

  def web_apps
    begin
      @web_apps ||= StampsWebApps.new param
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

  def web_reg_usr_dir
    begin
      if @web_reg_usr_dir.nil?
        if ParameterHelper.to_bool(ENV['JENKINS'])
          @web_reg_usr_dir ||= data_for(:web_reg, {})['jenkins_usr_dir']
        else
          @web_reg_usr_dir ||= "#{data_for(:web_reg, {})['dev_usr_dir']}:"
        end
      end
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      "MagicData: Problem retrieving data from default.yml. Check your format?".should eql e.message
    end
    @web_reg_usr_dir
  end

  def web_reg_usr_list_dir
    begin
      @web_reg_usr_list_dir ||= data_for(:web_reg, {})['web_reg_usr_list_dir']
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
