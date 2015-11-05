module Batch
  include Stamps

  def batch
    @batch ||= WebBatch.new(@browser)
  end
end