module Print
  class NavBar < PrintObject
    def username
      Label.new @browser.span :id => "userNameText"
    end
  end
end