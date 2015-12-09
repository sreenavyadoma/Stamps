module Orders
  include Stamps

  def orders
    @orders ||= Orders.new(@browser)
  end
end