module Postage
  module Locators
    class SignIn
      def self.username_text_field
        {:id => "UserNameTextBox"}
      end

      def self.password_text_field
        {:id => "PasswordTextBox"}
      end
    end

    class PrintOn
      def self.drop_down_divs
        {:css => "div[class*=x-form-trigger]"}
      end
    end

    class PrintFormBody
      def weight_input

      end
    end
  end
end

