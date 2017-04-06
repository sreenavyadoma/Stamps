module Stamps
  module Mail
    class NavBar < Browser::StampsModal
      attr_reader :username

      def initialize(param)
        super(param)
        @username = StampsElement.new browser.span id: "userNameText"
      end
    end
  end
end