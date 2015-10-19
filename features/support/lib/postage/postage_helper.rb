module Postage
  include Stamps

  def postage
    @batch ||= WebBatch.new(@browser)
  end
end