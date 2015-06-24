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

end