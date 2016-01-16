module Print
  class NavBar < Print::Postage::PrintObject
    def username
      Label.new @browser.span :id => "userNameText"
    end
  end
end