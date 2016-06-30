module Stamps
  module Print
    class NavBar < Print::Postage::PrintObject
      def username
        BrowserElement.new browser.span :id => "userNameText"
      end
    end
  end
end