module Postage
  class Navigation < PostageObject
    def username
      Label.new @browser.span :id => "userNameText"
    end
  end
end