module Stamps
  module Print
    class NavBar < Browser::Modal
      def username
        ElementWrapper.new browser.span id: "userNameText"
      end
    end
  end
end