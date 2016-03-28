module Orders
  include Stamps

  def orders
    PrintOrders.new @browser, @scenario_name
  end
end