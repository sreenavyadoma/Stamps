module Postage
  class Navigation < PostageObject
    def username_text_field
      Label.new @browser.span :id => "userNameText"
    end
  end
end