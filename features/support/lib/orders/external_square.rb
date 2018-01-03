
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

    class SquareLogin < Browser::BaseCache
      include ExternalSquare
      assign({})

      def cache
        self.class.cache
      end
    end
  end
end
