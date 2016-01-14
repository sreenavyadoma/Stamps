module Orders
  include Stamps

  def orders
    PrintOrders.new @browser
  end
end