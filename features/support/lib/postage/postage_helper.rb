module Postage
  include Stamps

  def print_postage
    @postage ||= Postage::PrintPostage.new @browser
  end
end
