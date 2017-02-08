module Stamps
  module Orders
    module Stores

      class VolusionShippingAddress < Browser::Modal
        class VolusionCountry < Browser::Modal
          def select(country)
            begin
              browser.select_list(:id, "ShipCountry").option(text: country).when_present.select
              browser.select_list(:id, "ShipCountry").option(text: country).when_present.select
            rescue
              #ignore
            end
          end
        end

        class VolusionState < Browser::Modal
          def select state
            begin
              browser.select_list(:id, "ShipState_dropdown").option(text: state).when_present.select
              browser.select_list(:id, "ShipState_dropdown").option(text: state).when_present.select
            rescue
              #ignore
            end
          end
        end

        class VolusionTypeOfAddress < Browser::Modal
          def residential
            browser.radio(css: 'input[name=ShipResidential][value=Y]').set
            browser.radio(css: 'input[name=ShipResidential][value=Y]').set
          end

          def business
            browser.radio(css: 'input[name=ShipResidential][value=N]').set
            browser.radio(css: 'input[name=ShipResidential][value=N]').set
          end
        end

        class VolusionBillingAddress < Browser::Modal
          def yes
            browser.radio(css: 'input[name=alsobilling][value=Y]').set
            browser.radio(css: 'input[name=alsobilling][value=Y]').set
          end

          def no
            browser.radio(css: 'input[name=alsobilling][value=N]').set
            browser.radio(css: 'input[name=alsobilling][value=N]').set
          end
        end

        def present?
          browser.text_field(name: "ShipFirstName").present?
        end

        def first_name
          StampsTextbox.new browser.text_field(name: "ShipFirstName")
        end

        def last_name
          StampsTextbox.new browser.text_field(name: "ShipLastName")
        end

        def company
          StampsTextbox.new browser.text_field(name: "ShipCompanyName")
        end

        def address_1
          StampsTextbox.new browser.text_field(name: "ShipAddress1")
        end

        def address_2
          StampsTextbox.new browser.text_field(name: "ShipAddress2")
        end

        def city
          StampsTextbox.new browser.text_field(name: "ShipCity")
        end

        def country
          VolusionCountry.new(param)
        end

        def state
          VolusionState.new(param)
        end

        def zip_code
          StampsTextbox.new browser.text_field(name: "ShipPostalCode")
        end

        def phone_number
          StampsTextbox.new browser.text_field(name: "ShipPhoneNumber")
        end

        def type_of_address
          VolusionTypeOfAddress.new(param)
        end

        def is_this_your_billing_address
          VolusionBillingAddress.new(param)
        end

        def continue
          button = StampsElement.new browser.text_field(name: "btnContinue")
          account_page = MyAccountPage.new(param)
          10.times do
            button.safe_click
            sleep(0.35)
            return account_page if account_page.present?
          end
        end
      end

      class VolusionCheckOut < Browser::Modal
        class VolusionAddressType < Browser::Modal
          def residential
            browser.radio(css: 'input[name=ShipResidential][value=Y]').set
            browser.radio(css: 'input[name=ShipResidential][value=Y]').set
          end

          def business
            browser.radio(css: 'input[name=ShipResidential][value=N]').set
            browser.radio(css: 'input[name=ShipResidential][value=N]').set
          end
        end

        def present?
          browser.h2(text: "Checkout").present?
        end

        def my_saved_billing_address address
          browser.select_list(:name, "My_Saved_Billing").option(text: address).select
          browser.select_list(:name, "My_Saved_Billing").option(text: address).select
          browser.select_list(:name, "My_Saved_Billing").option(text: address).select
        end


        def address_type
          VolusionAddressType.new(param)
        end

        def shipping_method method
          browser.select_list(:name, "ShippingSpeedChoice").option(value: @shipping_method_map[method]).select
          browser.select_list(:name, "ShippingSpeedChoice").option(value: @shipping_method_map[method]).select
          browser.select_list(:name, "ShippingSpeedChoice").option(value: @shipping_method_map[method]).select
        end

        def payment_method method
          browser.select_list(:name, "PaymentMethodTypeDisplay").option(text: method).select
          browser.select_list(:name, "PaymentMethodTypeDisplay").option(text: method).select
          browser.select_list(:name, "PaymentMethodTypeDisplay").option(text: method).select
        end

        def place_order
          button = StampsElement.new browser.button(id: "btnSubmitOrder")
          order_num_field = StampsElement.new browser.div(css: "main#content_area>table>tbody>tr>td>div")
          10.times do
            button.safe_click
            sleep(2)
            if order_num_field.present?
              order_number_str = order_num_field.text
              logger.info order_number_str
              order_number = /(\d+)/.match(order_number_str)
              logger.info "ORDER NUMBER:  #{order_number}"
              return order_number
            end
          end
        end
      end

      class VolusionCart < Browser::Modal
        def visit
          browser.goto "http://ywvmt.dmjeb.servertrust.com/shoppingcart.asp"
        end

        def present?
          browser.text_field(css: "input[name='btn_checkout_guest']").present?
        end

        def count
          count = element_helper.text browser.span(css: "span[data-v-observable=cart-count]")
          logger.info "Volusion Cart Count: #{count}"
          count.to_i
        end

        def proceed_to_checkout
          button = StampsElement.new browser.text_field(css: "input[name='btn_checkout_guest']")
          checkout = VolusionCheckOut.new(param)
          10.times do
            button.safe_click
            sleep(0.35)
            return checkout if checkout.present?
          end
          "Unable to proceed to checkout!").to eql ""
        end
      end

      class VolusionProduct < Browser::Modal
        def present?
          browser.text_field(css: "input[alt='Add to cart']").present?
        end

        def qty_field
          StampsTextbox.new browser.text_field(name: 'QTY.SAMPLE1')
        end

        def qty number
          @qty_to_add = number.to_i
          field = qty_field
          field.set @qty_to_add
        end

        def add_to_bag
          qty_textbox = self.qty_field
          shopping_cart = VolusionCart.new(param)
          cart_count_b4_add = shopping_cart.count
          button = StampsElement.new browser.text_field(css: "input[alt='Add to cart']")
          2.times do
            button.safe_click
            break if (cart_count_b4_add + @qty_to_add) == shopping_cart.count
            sleep(2)
            break if (cart_count_b4_add + @qty_to_add) == shopping_cart.count
            break if (cart_count_b4_add + @qty_to_add) == shopping_cart.count
          end
        end
      end

      class VolusionCategoryOne < Browser::Modal
        def present?
          browser.a(css: "a[title='SAMPLE PRODUCT ONE, SAMPLE1']").present?
        end

        def sample_product_one
          link = StampsElement.new browser.a(css: "a[title='SAMPLE PRODUCT ONE, SAMPLE1']")
          product = VolusionProduct.new(param)
          10.times do
            link.safe_click
            sleep(0.35)
            return product if product.present?
          end
        end
      end

      class MyAccountPage < Browser::Modal
        def log_out
          logged_out_field = StampsElement.new browser.li(text: "You are now logged out.")
          button = StampsElement.new browser.a(css: "a[href*=logout]")
          5.times do
            button.safe_click
            sleep(0.35)
            return VolusionLoginPage.new(param) if logged_out_field.present?
          end
        end

        def present?
          browser.a(css: "a[href*=logout]").present?
        end

        def my_account
          link = StampsElement.new browser.a(text: "My Account")
          label = StampsElement.new browser.b(text: "My Orders")
          10.times do
            link.safe_click
            break if label.present?
          end

          def cart
            shopping_cart = VolusionCart.new(param)
            shopping_cart.visit
            shopping_cart
          end
        end

        def category_one
          link = StampsElement.new(browser.as(text: "CATEGORY ONE").last)
          category_1 = VolusionCategoryOne.new(param)
          10.times do
            link.safe_click
            sleep(0.35)
            return category_1 if category_1.present?
          end
        end
      end

      class VolusionRegistration < Browser::Modal
        class ReceiveNewsLetterCheckbox < Browser::Modal
          def check
            browser.checkbox(name: 'emailsubscriber').set
            browser.checkbox(name: 'emailsubscriber').set
          end

          def uncheck
            browser.checkbox(name: 'emailsubscriber').clear
            browser.checkbox(name: 'emailsubscriber').clear
          end
        end

        def present?
          browser.text_field(name: "Email").present?
        end

        def email
          StampsTextbox.new browser.text_field(name: "Email")
        end

        def email_again
          StampsTextbox.new browser.text_field(name: "Emailagain")
        end

        def password
          StampsTextbox.new browser.text_field(name: "password")
        end

        def password_again
          StampsTextbox.new browser.text_field(name: "passwordagain")
        end

        def receive_newsletter
          ReceiveNewsLetterCheckbox.new(param)
        end

        def continue
          button = StampsElement.new browser.text_field(id: "btnContinue")
          shipping_address = VolusionShippingAddress.new(param)
          10.times do
            button.safe_click
            sleep(0.35)
            return shipping_address if shipping_address.present?
          end
        end
      end

      class VolusionLoginPage < Browser::Modal
        def visit
          browser.goto "http://ywvmt.dmjeb.servertrust.com/myaccount.asp"
        end

        def present?
          browser.text_field(name: "email").present?
        end

        def email
          StampsTextbox.new browser.text_field(name: "email")
        end

        def password
          StampsTextbox.new browser.text_field(name: "password")
        end

        def login
          StampsElement.new browser.text_field(css: "input[src*=btn_login]")
        end

        def continue
          button = StampsElement.new browser.img(css: "img[src*=Continue]")
          webreg = VolusionRegistration.new(param)
          10.times do
            button.safe_click
            sleep(0.35)
            return webreg if webreg.present?
          end
        end
      end
    end
  end
end