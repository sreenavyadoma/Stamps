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
      @webreg ||= WebReg::Registration.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
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

  def stop_test error_message
    @orders_object ||= Modal.new param
    @orders_object.stop_test error_message
  end
end
