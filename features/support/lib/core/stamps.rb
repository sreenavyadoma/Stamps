module Stamps

  extend self

  def init scenario
    TestHelper.init scenario
  end

  def teardown
    begin
      TestHelper.teardown
    rescue
      #ignore
    end
  end

  def health
    HealthCheck.new param
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

  def orders
    begin
      @orders ||= WebOrders.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def postage
    begin
      @print_postage = PrintPostage.new param
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def param
    param = ModalParam.new
    param.browser = test_helper.browser
    param.logger = test_helper.logger
    param.scenario_name = test_helper.scenario_name
    param
  end

  def print_postage

  end

  def test_helper
    TestHelper
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
