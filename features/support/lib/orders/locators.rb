module Stamps
  module Orders
    module Locators
      module OrderDetails
        class << self

        end

      end

      module OrdersGrid
        class << self
          def present
            {css: "div[id^=ordersGrid][id$=body]"}
          end
        end
      end

      module NavBar
        class << self
          def username
            {id: "userNameText"}
          end
        end
      end

      module PrintModal
        class << self
          def date_picker_button
            {id: "sdc-printpostagewindow-shipdate-trigger-picker"}
          end
        end
      end

      module SignIn
        class << self
          def username
            {id: 'UserNameTextBox'}
          end

          def password
            {id: 'PasswordTextBox'}
          end

          def sign_in
            {id: 'signInButton'}
          end

        end
      end

    end
  end
end