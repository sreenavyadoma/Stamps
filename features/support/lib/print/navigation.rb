module Stamps
  module Print
    class NavBar < Browser::Modal
      def username
        BrowserElement.new browser.span :id => "userNameText"
      end
    end
  end
end