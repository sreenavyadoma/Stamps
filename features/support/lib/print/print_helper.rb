module Print
  def postage
    Print::PrintPostage.new @browser, @scenario_name
  end
  #
end
