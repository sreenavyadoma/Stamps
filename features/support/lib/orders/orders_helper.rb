module Orders
  include Stamps

  def orders
    @orders ||= PrintOrders.new @browser
  end
end