module Stamps

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
    @web_apps ||= StampsWebApps.new param
  end

  def orders
    @orders ||= WebOrders.new param
  end

  def postage
    PrintPostage.new param
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

  extend self
end
