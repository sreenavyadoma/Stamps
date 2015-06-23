module Batch
  require_relative 'batch'
  require_relative '../../lib/common/stamps_test'

  def setup
    @batch = Batch::WebBatch.new(Stamps.setup)
  end

  def batch
    @batch
  end

  def teardown
    Stamps.teardown
  end

  def new_order_row
    1
  end
=begin

  # @return [SingleOrderEditForm]
  def single_order
    @single_order_form ||= instance.single_order
  end

  def order_grid
    @order_grid ||= instance.grid
  end

  def partial_address
    @address_validation_form ||= single_order.partial_address
  end
=end

end