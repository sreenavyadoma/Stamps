module Print
  module Locators
    class SignIn
      def self.username
        {:id => "UserNameTextBox"}
      end

      def self.password
        {:id => "PasswordTextBox"}
      end

      def self.button
        {:id => "signInButton"}
      end
    end

    class FormBody
      def self.print_on_drop_down_divs
        {:css => "div[class*=x-form-trigger]"}
      end

      def self.print_on_text_field
        {:name => "media"}
      end
      def weight_input

      end

      def ounces_input

      end
    end
  end
end

