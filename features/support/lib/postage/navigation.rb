module Postage
  class NavBar < PostageObject
    def username
      Label.new @browser.span :id => "userNameText"
    end
  end
end