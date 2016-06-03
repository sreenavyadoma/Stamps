module Orders
  include Stamps

  def orders
    WebOrders.new @browser, @scenario_name
  end

  def stop_test error_message
    @orders_object ||= BrowserObject.new @browser
    @orders_object.stop_test error_message
  end
end