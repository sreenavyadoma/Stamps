module Batch
  module Locators
    module OrderDetails

    end

    module OrdersGrid
      def self.present
        {:css => "div[id^=ordersGrid][id$=body]"}
      end
    end

    module FilterPanel

    end

    module NavBar
      def self.username
        {:id => "userNameText"}
      end
    end

    module ToolBar

    end

    module PrintModal
      def self.date_picker_button
        {:id => "sdc-printpostagewindow-shipdate-trigger-picker"}
      end
    end

    module SignIn
      def self.username
        {:id => 'UserNameTextBox'}
      end

      def self.password
        {:id => 'PasswordTextBox'}
      end

      def self.sign_in
        {:id => 'signInButton'}
      end

    end

  end
end

