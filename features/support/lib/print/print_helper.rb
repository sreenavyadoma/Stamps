module Print
  include Stamps

  def print_postage
    @postage ||= Print::PrintPostage.new @browser
  end
end
