module Orders
  module Locators
    module OrderDetails
      class << self

      end

    end

    module OrdersGrid
      class << self
        def present
          {:css => "div[id^=ordersGrid][id$=body]"}
        end
      end
    end

    module FilterPanel
      class << self

      end

    end

    module NavBar
      class << self
        def username
          {:id => "userNameText"}
        end
      end
    end

    module ToolBar
      class << self
        def add
          {:text => 'Add'}
        end

        def postage

        end

        def move
          {:text => "Move"}
        end

        def confirmation_modal_move_label
          {:css => "span[class*='x-btn-inner-primary-blue-medium']"}
        end

        def confirmation_modal_cancel_label
          {:text => "Cancel"}
        end
      end
    end

    module PrintModal
      class << self
        def date_picker_button
          {:id => "sdc-printpostagewindow-shipdate-trigger-picker"}
        end
      end
    end

    module SignIn
      class << self
        def username
          {:id => 'UserNameTextBox'}
        end

        def password
          {:id => 'PasswordTextBox'}
        end

        def sign_in
          {:id => 'signInButton'}
        end

      end
    end

  end
end

