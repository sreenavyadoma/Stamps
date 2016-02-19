module Print
  class NavBar < Print::Postage::PrintObject
    def username
      StampsLabel.new @browser.span :id => "userNameText"
    end
  end
end