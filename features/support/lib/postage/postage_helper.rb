module Postage
  include Stamps

  def print_postage
    @batch ||= PrintPostage.new(@browser)
  end
end