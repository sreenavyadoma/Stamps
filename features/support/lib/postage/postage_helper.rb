module Postage
  include Stamps

  def postage
    @batch ||= WebPostage.new(@browser)
  end
end