module Print
  include Stamps

  def postage
    Print::PrintPostage.new @browser
  end
end
