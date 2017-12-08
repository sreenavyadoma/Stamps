
module Stamps
  module Orders
    module ExternalSquare
      def email
        StampsTextbox.new (browser.text_field(css: "input[id='email']"))
      end

      def password
        StampsTextbox.new (browser.text_field(css: "input[id='password']"))
      end

      def sign_in
        browser.button(id: 'sign-in-button')
      end
    end

    class SquareLogin
    include ExternalSquare
    end

  end
end
