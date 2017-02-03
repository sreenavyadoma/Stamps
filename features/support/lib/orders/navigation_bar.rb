module Stamps
  module Navigation #todo-rob Refactor to WebApps module
    class TransactionComplete < Browser::Modal
      attr_reader :window_title, :text_area

      def initialize(param)
        super(param)
        @window_title = StampsElement.new browser.div(text: "Transaction Complete")
        @text_area = StampsElement.new browser.div(css: "div[componentid^=dialoguemodal-]>div[id$=body]>div>div")
      end

      def wait_until_present *args
        window_title.safely_wait_until_present *args
      end

      def present?
        window_title.present?
      end

      def text
        text_area.text
      end

      def ok_button
        StampsElement.new(param.web_app == :orders)?((browser.spans text: 'OK').last):(browser.span(id: 'sdc-undefinedwindow-okbtn-btnIconEl'))
      end

      def ok
        ok_button.safely_wait_until_present 5
        ok_button.click_while_present
      end
    end

    class ConfirmTransaction < Browser::Modal
      attr_reader :window_title, :transaction_complete, :confirm_btn

      def initialize(param)
        super(param)
        @window_title = StampsElement.new browser.div(text: 'Confirm Transaction')
        @confirm_btn = StampsElement.new browser.span(text: "Confirm")
        @transaction_complete = TransactionComplete.new(param)
      end

      def exit
        button = StampsElement.new(browser.imgs class: "x-tool-img x-tool-close").last
        button.click_while_present
      end

      def present?
        window_title.present?
      end

      def wait_until_present *args
        window_title.safely_wait_until_present *args
      end

      def text_area
        if param.web_app == :orders
          div = browser.div(class: 'sdc-dialoguemodal-confirm-purchase')
        elsif param.web_app == :mail
          div = browser.divs(css: "div[id^=dialoguemodal-][id$=-innerCt]").last
        else
          "Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test.".should eql "Invalid Value"
        end
        StampsElement.new div
      end

      def text
        text_area.text
      end

      def confirm
        10.times do
          return transaction_complete if transaction_complete.present?
          confirm_btn.safe_click
          transaction_complete.wait_until_present 6
        end
        "Unable to click Confirm button on Confirm Transaction modal!".should eql "Confirm Transaction Modal"
      end
    end

    class MinimumPurchaseAmountNotice < Browser::Modal
      def present?

      end

      def text

      end

      def ok

      end
    end

    class AutoBuyPostageModal < Browser::Modal
      attr_reader

      def initialize(param)
        super(param)

      end
    end

    class BuyPostageModal < Browser::Modal
      attr_reader :confirm_transaction, :auto_buy_postage_modal, :auto_buy_postage_link, :window_title

      def initialize(param)
        super(param)
        @confirm_transaction = ConfirmTransaction.new(param)
        @auto_buy_postage_modal = AutoBuyPostageModal.new(param)
        @auto_buy_postage_link = StampsElement.new browser.span(text: "Auto-buy postage")
        @window_title = browser.div(text: "Add Funds")
      end

      def auto_buy_postage
        10.times do
          auto_buy_postage_link.safe_click
          return auto_buy_postage_modal if auto_buy_postage_modal.present?
        end
        "Auto-Buy Postage modal did not open.".should eql "Unable to open Auto-Buy Postage modal upon clicking Auto-buy postage link"
      end

      def purchase_button
        if param.web_app == :orders
          button = browser.span(id: "sdc-purchasewin-purchasebtn-btnInnerEl")
        elsif param.web_app == :mail
          button = browser.span(id: "sdc-purchasewin-purchasebtn-btnIconEl")
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end
        StampsElement.new button
      end

      def present?
        window_title.present?
      end

      def buy_10
        param.web_app.should_not be nil
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-10dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-10dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          #
        end
      end

      def buy_25
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-25dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-25dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end

      end

      def buy_50
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-50dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-50dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end
      end

      def buy_100
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-100dradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-100dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end
      end

      def buy_other value
        if param.web_app == :orders
          checkbox_element = browser.label(css: "label[for=sdc-purchasewin-otherdradio][id$=boxLabelEl]")
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          checkbox = StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.web_app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-otherdradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          checkbox = StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end

        textbox = StampsTextbox.new(browser.text_field id: "sdc-purchasewin-otheramount")

        checkbox.select
        textbox.set(value)
      end

      def purchase
        return confirm_transaction if confirm_transaction.present?
        10.times do
          return confirm_transaction if confirm_transaction.present?
          purchase_button.safe_click
          confirm_transaction.wait_until_present 6
        end
        raise "Confirm Purchase Modal did not open after clicking Purchase button on Buy Mail modal..." unless confirm_transaction.present?
      end

      def edit_payment_method
        "Edit Payment Method is not yet implemented.".should eql ""
      end

      def autobuy
        "AutoBuy is not implemented".should eql ""
      end
    end

    class BalanceDropDown < Browser::Modal
      attr_reader :buy_postage_modal, :buy_more_drop_down, :buy_more_link, :view_history_link, :balance_element

      def initialize(param)
        super(param)

        @buy_postage_modal = BuyPostageModal.new(param)
        @buy_more_drop_down = StampsElement.new(browser.span class: "balanceLabel")
        @buy_more_link = StampsElement.new(browser.a text: "Buy More")
        @view_history_link = StampsElement.new(browser.a text: "View Purchase History")
        @balance_element = StampsElement.new browser.span id: 'postageBalanceAmt'
      end

      def buy_more
        20.times do
          return buy_postage_modal if buy_postage_modal.present?
          buy_more_drop_down.element.hover
          buy_more_drop_down.safe_click unless buy_more_link.present?
          buy_more_drop_down.element.hover
          buy_more_link.safe_click
          return buy_postage_modal if buy_postage_modal.present?
        end
        "Unable to open Buy Postage Modal".should eql "buy_more failed"
      end

      def purchase_history
        2.times do
          buy_more_drop_down.element.hover
          buy_more_drop_down.safe_click unless view_history_link.present?
          buy_more_drop_down.element.hover
          view_history_link.safe_click
        end
      end

      def amount
        10.times do
          amount = balance_element.text
          amount_no_dollar_sign = amount.gsub("$","")
          amount_stripped_all = amount_no_dollar_sign.gsub(",","")
          return amount_stripped_all if amount_stripped_all.length > 0
        end
      end

      def new_balance old_balance
        10.times do
          balance = ParameterHelper.remove_dollar_sign balance_element.text
          break unless balance.include? old_balance.to_s
          sleep(1)
        end
        ParameterHelper.remove_dollar_sign balance_element.text
      end
    end

    class UsernameDropDown < Browser::Modal
      attr_reader :username, :sign_out_link

      def initialize(param)
        super(param)
        @username = StampsElement.new browser.span id: 'userNameText'
        @sign_out_link = browser.a text: "Sign Out"
      end

      def present?
        username.present?
      end

      def wait_until_present *args
        username.wait_until_present *args
      end

      def text
        username.text
      end

      def manage_account

      end

      def home

      end

      def sign_out
        5.times do
          sleep(1)
          username.safe_click unless sign_out_link.present?
          username.hover
          element_helper.safe_click sign_out_link if sign_out_link.present?
          sleep(1)
          return if browser.url.include? "SignIn"
        end
      end
    end

    class NavigationBar < Browser::Modal
      attr_reader :balance, :username, :sign_out_link, :signed_in_username, :orders_link, :mail_link, :web_mail, :web_orders

      def initialize(param)
        super(param)
        @balance = BalanceDropDown.new(param)
        @username = UsernameDropDown.new(param)
        @sign_out_link = StampsElement.new browser.link(id: "signOutLink")
        @signed_in_username = StampsElement.new browser.span(id: 'userNameText')
        @orders_link = StampsElement.new browser.a(text: 'Orders')
        @mail_link = StampsElement.new browser.a(text: 'Mail')
        @web_mail = WebMail.new(param)
        @web_orders = WebOrders.new(param)
      end

      def orders
        10.times do
          orders_link.safe_click
          web_orders.wait_until_present 8
          return web_orders if grid.present?
        end
      end

      def mail
        10.times do
          mail_link.safe_click
          web_mail.wait_until_present 8
          return web_mail if grid.present?
        end
      end

      def sign_out
        20.times {
          begin
            signed_in_username.safe_click unless sign_out_link.present?
            sign_out_link.safe_click
            sign_out_link.safe_click
            signed_in_username.safe_click unless sign_out_link.present?
            sign_out_link.safe_click
            sleep(1)
            sign_out_link.safe_click
            break unless signed_in_username.present?
          rescue
            #ignore
          end
        }
        logger.info "#{ENV["SIGNED_IN_USER"]}#{(signed_in_username.present?)?" - sign-out failed":" was signed out.  Goodbye."}"
      end

      def wait_until_present *args
        username.wait_until_present *args
      end

      def present?
        username.present?
      end

    end
  end
end