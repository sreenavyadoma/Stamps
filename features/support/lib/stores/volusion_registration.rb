module Stores

  class VolusionShippingAddress < Stamps::Browser::BrowserObject
    class VolusionCountry < Stamps::Browser::BrowserObject
      def select country
        begin
          @browser.select_list(:id, "ShipCountry").option(:text => country).when_present.select
          @browser.select_list(:id, "ShipCountry").option(:text => country).when_present.select
        rescue
          #ignore
        end
      end
    end

    class VolusionState < Stamps::Browser::BrowserObject
      def select state
        begin
          @browser.select_list(:id, "ShipState_dropdown").option(:text => state).when_present.select
          @browser.select_list(:id, "ShipState_dropdown").option(:text => state).when_present.select
        rescue
          #ignore
        end
      end
    end

    class VolusionTypeOfAddress < Stamps::Browser::BrowserObject
      def residential
        @browser.radio(css: 'input[name=ShipResidential][value=Y]').set
        @browser.radio(css: 'input[name=ShipResidential][value=Y]').set
      end

      def business
        @browser.radio(css: 'input[name=ShipResidential][value=N]').set
        @browser.radio(css: 'input[name=ShipResidential][value=N]').set
      end
    end

    class VolusionBillingAddress < Stamps::Browser::BrowserObject
      def yes
        @browser.radio(css: 'input[name=alsobilling][value=Y]').set
        @browser.radio(css: 'input[name=alsobilling][value=Y]').set
      end

      def no
        @browser.radio(css: 'input[name=alsobilling][value=N]').set
        @browser.radio(css: 'input[name=alsobilling][value=N]').set
      end
    end

    def present?
      browser_helper.present? @browser.text_field(name: "ShipFirstName")
    end

    def first_name
      StampsTextbox.new @browser.text_field(name: "ShipFirstName")
    end

    def last_name
      StampsTextbox.new @browser.text_field(name: "ShipLastName")
    end

    def company
      StampsTextbox.new @browser.text_field(name: "ShipCompanyName")
    end

    def city
      StampsTextbox.new @browser.text_field(name: "ShipCity")
    end

    def country
      VolusionCountry.new @browser
    end

    def state
      VolusionState.new @browser
    end

    def zip_code
      StampsTextbox.new @browser.text_field(name: "ShipPostalCode")
    end

    def type_of_address
      VolusionTypeOfAddress.new @browser
    end

    def billing_address
      VolusionBillingAddress.new @browser
    end

    def continue
      button = StampsButton.new @browser.input(name: "btnContinue")
      account_page = VolusionAccount.new @browser
      10.times do
        button.safe_click
        sleep 1
        return account_page if account_page.present?
      end
    end
  end

  class VolusionCheckOut < Stamps::Browser::BrowserObject
    class VolusionAddressType < Stamps::Browser::BrowserObject
      def residential
        @browser.radio(css: 'input[name=ShipResidential][value=Y]').set
        @browser.radio(css: 'input[name=ShipResidential][value=Y]').set
      end

      def business
        @browser.radio(css: 'input[name=ShipResidential][value=N]').set
        @browser.radio(css: 'input[name=ShipResidential][value=N]').set
      end
    end

    def present?
      browser_helper.present? @browser.input(css: "input[name='btn_checkout_guest']")
    end

    def my_saved_billing_address address
      @browser.select_list(:name, "My_Saved_Billing").option(:text => address).when_present.select
      @browser.select_list(:name, "My_Saved_Billing").option(:text => address).when_present.select
    end


    def address_type
      VolusionAddressType.new @browser
    end

    def place_order
      @browser.span(text: "Place Order")
    end
  end

  class VolusionCart < Stamps::Browser::BrowserObject
    def visit
      @browser.goto "http://ywvmt.dmjeb.servertrust.com/shoppingcart.asp"
    end

    def present?
      browser_helper.present? @browser.input(css: "input[name='btn_checkout_guest']")
    end

    def count
      count = browser_helper.text @browser.span(css: "span[data-v-observable=cart-count]")
      log.info "Volusion Cart Count: #{count}"
      count.to_i
    end

    def proceed_to_checkout
      button = @browser.input(css: "input[name='btn_checkout_guest']")
      checkout = VolusionCheckOut.new @browser
      5.times do
        button.safe_click
        sleep 1
        return checkout if checkout.present?
      end
    end
  end

  class VolusionProduct < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.input(css: "input[alt='Add to cart']")
    end

    def qty_field
      StampsTextbox.new @browser.text_field(name='QTY.SAMPLE1')
    end

    def qty number
      @qty_to_add = number
      qty_field.set @qty_to_add
    end

    def add_to_bag
      qty_textbox = self.qty_field
      qty_txtbox_value_b4_add = qty_textbox.text.to_i
      button = StampsButton.new  @browser.input(css: "input[alt='Add to cart']")
      3.times do
        button.safe_click
        sleep 2
        break if (qty_txtbox_value_b4_add + @qty_to_add) == qty_field.text.to_i
      end
    end

    def cart
      shopping_cart = VolusionCart.new @browser
      shopping_cart.visit
      shopping_cart
    end
  end

  class VolusionCategoryOne < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.a(css: "a[title='SAMPLE PRODUCT ONE, SAMPLE1']")
    end

    def sample_product_one
      link = StampsLink.new @browser.a(css: "a[title='SAMPLE PRODUCT ONE, SAMPLE1']")
      product = VolusionProduct.new @browser
      10.times do
        link.safe_click
        sleep 1
        return product if product.present?
      end
    end
  end

  class VolusionAccount < Stamps::Browser::BrowserObject
    def log_out
      logged_out_field = StampsLabel.new @browser.li(text: "You are now logged out.")
      button = StampsButton.new @browser.a(css: "a[href*=logout]")
      5.times do
        button.safe_click
        sleep 1
        break if logged_out_field.present?
      end
    end

    def present?
      browser_helper.present? @browser.a(css: "a[href*=logout]")
    end

    def my_account
      link = StampsLink.new @browser.a(text: "My Account")
      3.times do
        link.safe_click
      end
    end

    def category_one
      link = StampsLink.new (@browser.as(text: "CATEGORY ONE").last)
      category_1 = VolusionCategoryOne.new @browser
      10.times do
        link.safe_click
        sleep 1
        return category_1 if category_1.present?
      end
    end
  end

  class VolusionRegistration < Stamps::Browser::BrowserObject
    class ReceiveNewsLetterCheckbox < Stamps::Browser::BrowserObject
      def check
        @browser.checkbox(:name => 'emailsubscriber').set
        @browser.checkbox(:name => 'emailsubscriber').set
      end

      def uncheck
        @browser.checkbox(:name => 'emailsubscriber').clear
        @browser.checkbox(:name => 'emailsubscriber').clear
      end
    end

    def present?
      browser_helper.present? @browser.text_field(name: "Email")
    end

    def email
      StampsTextbox.new @browser.text_field(name: "Email")
    end

    def email_again
      StampsTextbox.new @browser.text_field(name: "Emailagain")
    end

    def password
      StampsTextbox.new @browser.text_field(name: "password")
    end

    def password_again
      StampsTextbox.new @browser.text_field(name: "passwordagain")
    end

    def receive_newsletter
      ReceiveNewsLetterCheckbox.new @browser
    end

    def continue
      button = StampsInput.new @browser.input(id: "btnContinue")
      shipping_address = VolusionShippingAddress.new @browser
      10.times do
        button.safe_click
        sleep 1
        return shipping_address if shipping_address.present?
      end
    end
  end
  class VolusionLoginPage < Stamps::Browser::BrowserObject
    def visit
      @browser.goto "http://ywvmt.dmjeb.servertrust.com/myaccount.asp"
    end

    def present?
      browser_helper.present? @browser.text_field(name: "email")
    end

    def email
      StampsTextbox.new @browser.text_field(name: "email")
    end

    def password
      StampsTextbox.new @browser.text_field(name: "password")
    end

    def login
      @browser.input(css: "input[src*=btn_login]")
    end

    def continue
      button = StampsInput.new @browser.img(css: "img[src*=Continue]")
      registration = VolusionRegistration.new @browser
      10.times do
        button.safe_click
        sleep 1
        return registration if registration.present?
      end
    end
  end
end