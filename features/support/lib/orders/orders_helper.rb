module Orders
  include Stamps

  def orders
    WebOrders.new @browser, @scenario_name
  end
end