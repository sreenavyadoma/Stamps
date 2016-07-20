module Stamps
  module Print
    class NavBar < Browser::Modal
      attr_reader :username

      def initialize param
        super param
        @username ||= ElementWrapper.new browser.span id: "userNameText"
      end
    end
  end
end