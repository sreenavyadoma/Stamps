module Stamps
  module Navigation #todo-rob Refactor to WebApps module
    class PurchaseApproved < Browser::Modal
      attr_reader :ok_button, :window_title

      def initialize param
        super param
        @ok_button = ElementWrapper.new (param.app == :orders)?((browser.spans text: 'OK').last):(browser.span(id: 'sdc-undefinedwindow-okbtn-btnIconEl'))
        @window_title = ElementWrapper.new browser.div text: "Purchase Approved"
      end

      def wait_until_present *args
        window_title.safely_wait_until_present *args
      end

      def present?
        window_title.present?
      end

      def text_area
        ElementWrapper.new (browser.divs css: "div[id^=dialoguemodal-][id$=-innerCt]").last
      end

      def text
        text_area.text
      end

      def ok
        ok_button.safely_wait_until_present 5
        ok_button.click_while_present
      end
    end

    class ConfirmPurchase < Browser::Modal
      attr_reader :window_title

      def initialize param
        super param
        @window_title = ElementWrapper.new browser.div text: 'Confirm Purchase'
      end

      def exit
        button = ElementWrapper.new (browser.imgs class: "x-tool-img x-tool-close").last
        button.click_while_present
      end

      def present?
        window_title.present?
      end

      def wait_until_present *args
        window_title.safely_wait_until_present *args
      end

      def text_area
        if param.app == :orders
          div = browser.div class: 'sdc-dialoguemodal-confirm-purchase'
        elsif param.app == :mail
          div = browser.divs(css: "div[id^=dialoguemodal-][id$=-innerCt]").last
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end
        ElementWrapper.new div
      end

      def text
        text_area.text
      end

      def purchase_button
        if param.app == :orders
          button = (browser.spans text: "Purchase").last
        elsif param.app == :mail
          button = browser.spans(css: "span[id$=-purchasebtn-btnIconEl]").last
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end
        ElementWrapper.new button
      end

      def purchase
        purchase_approved = PurchaseApproved.new param

        10.times do
          return purchase_approved if purchase_approved.present?
          purchase_button.safe_click
          purchase_approved.wait_until_present 6
        end
        raise "Purchase Approved modal did not open!"
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

      def initialize param
        super param

      end
    end

    class BuyPostageModal < Browser::Modal
      attr_reader :confirm_postage, :confirm_purchase, :auto_buy_postage_modal, :auto_buy_postage_link

      def initialize param
        super param
        @confirm_postage ||= ConfirmPurchase.new param
        @confirm_purchase ||= ConfirmPurchase.new param
        @auto_buy_postage_modal ||= AutoBuyPostageModal.new param
        @auto_buy_postage_link = ElementWrapper.new browser.span(text: "Auto-buy postage")
      end

      def auto_buy_postage
        10.times do
          auto_buy_postage_link.safe_click
          return auto_buy_postage_modal if auto_buy_postage_modal.present?
        end
        "Auto-Buy Postage modal did not open.".should eql "Unable to open Auto-Buy Postage modal upon clicking Auto-buy postage link"
      end

      def purchase_button
        if param.app == :orders
          button = browser.span(id: "sdc-purchasewin-purchasebtn-btnInnerEl")
        elsif param.app == :mail
          button = browser.span(id: "sdc-purchasewin-purchasebtn-btnIconEl")
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end
        ElementWrapper.new button
      end

      def present?
        (browser.div text: "Buy Postage").present?
      end

      def buy_10
        if param.app == :orders
          checkbox_element = (browser.label text: "$10.00").parent.span
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-10dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end
      end

      def buy_25
        if param.app == :orders
          checkbox_element = (browser.label text: "$25.00").parent.span
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-25dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end

      end

      def buy_50
        if param.app == :orders
          checkbox_element = (browser.label text: "$50.00").parent.span
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-50dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end
      end

      def buy_100
        if param.app == :orders
          checkbox_element = (browser.label text: "$100.00").parent.span
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-100dradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end
      end

      def buy_other value
        if param.app == :orders
          checkbox_element = (browser.label text: /Other:/).parent.span
          verify_element = checkbox_element.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          checkbox = RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        elsif param.app == :mail
          checkbox_element = browser.input id: "sdc-purchasewin-otherdradio"
          verify_element = checkbox_element.parent.parent.parent.parent
          attribute = "class"
          verify_element_attrib = "checked"
          checkbox = RadioElement.new checkbox_element, verify_element, attribute, verify_element_attrib
        else
          "raise Purchase Button failure. #{param.app} is not a valid value for param.app, check your test."
        end

        textbox = TextboxElement.new (browser.text_field id: "sdc-purchasewin-otheramount")

        checkbox.select
        textbox.set value
      end

      def purchase
        return confirm_purchase if confirm_purchase.present?
        10.times do
          return confirm_purchase if confirm_purchase.present?
          purchase_button.safe_click
          confirm_purchase.wait_until_present 6
        end
        raise "Confirm Purchase Modal did not open after clicking Purchase button on Buy Mail modal..." unless confirm_purchase.present?
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

      def initialize param
        super param

        @buy_postage_modal = BuyPostageModal.new param
        @buy_more_drop_down = ElementWrapper.new (browser.span class: "balanceLabel")
        @buy_more_link = ElementWrapper.new (browser.a text: "Buy More")
        @view_history_link = ElementWrapper.new (browser.a text: "View Purchase History")
        @balance_element = ElementWrapper.new browser.span id: 'postageBalanceAmt'
      end

      def buy_more
        return buy_postage_modal if buy_postage_modal.present?
        20.times do
          return buy_postage_modal if buy_postage_modal.present?
          buy_more_drop_down.element.hover
          buy_more_drop_down.safe_click unless buy_more_link.present?
          buy_more_drop_down.element.hover
          buy_more_link.safe_click
          return buy_postage_modal if buy_postage_modal.present?
        end
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
        10.times{
          amount = balance_element.text
          amount_no_dollar_sign = amount.gsub("$","")
          amount_stripped_all = amount_no_dollar_sign.gsub(",","")
          return amount_stripped_all if amount_stripped_all.length > 0
        }
      end

      def new_balance old_balance
        10.times{
          balance = ParameterHelper.remove_dollar_sign balance_element.text
          break unless balance.include? old_balance.to_s
          sleep(1)
        }
        ParameterHelper.remove_dollar_sign balance_element.text
      end
    end

    class UsernameDropDown < Browser::Modal
      attr_reader :username, :sign_out_link

      def initialize param
        super param
        @username = ElementWrapper.new browser.span id: 'userNameText'
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
        20.times do
          username.safe_click unless sign_out_link.present?
          username.hover
          element_helper.safe_click sign_out_link if sign_out_link.present?
          return if browser.url.include? "SignIn"
        end
      end
    end

    class NavigationBar < Browser::Modal
      attr_reader :balance, :username, :sign_out_link, :signed_in_username, :orders_link, :mail_link, :web_mail, :web_orders

      def initialize param
        super param
        @balance ||= BalanceDropDown.new param
        @username ||= UsernameDropDown.new param
        @sign_out_link = ElementWrapper.new browser.link id: "signOutLink"
        @signed_in_username = ElementWrapper.new browser.span id: 'userNameText'
        @orders_link = ElementWrapper.new browser.a text: 'Orders'
        @mail_link = ElementWrapper.new browser.a text: 'Mail'
        @web_mail ||= WebMail.new param
        @web_orders ||= WebOrders.new param
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
            sleep 1
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