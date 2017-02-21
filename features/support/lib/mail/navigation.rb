module Stamps
  module Mail
    class NavBar < Browser::StampsHtmlField
      attr_reader :username

      def initialize(param)
        super(param)
        @username = StampsElement.new browser.span id: "userNameText"
      end
    end
  end
end