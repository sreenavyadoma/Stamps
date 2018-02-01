module Stamps
  module Navigation
    class TransactionComplete < Browser::BaseCache
      #assign({})

      def window_title
        cache[:window_title] = StampsField.new(browser.div(text: "Transaction Complete")) if cache[:window_title].nil? || !cache[:window_title].present?
        cache[:window_title]
      end

      def textarea
        if cache[:textarea].nil? || !cache[:textarea].present?
          cache[:textarea] = StampsField.new(browser.div(css: "div[componentid^=dialoguemodal-]>div[id$=body]>div>div"))
        end
        cache[:textarea]
      end

      def ok_btn
        if cache[:ok_btn].nil? || !cache[:ok_btn].present?
          cache[:ok_btn] = StampsField.new(browser.span(css: "div[id^=panel-][id$=-innerCt]>a>span>span>span[id$=btnInnerEl]"))
        end
        cache[:ok_btn]
      end

      def wait_until_present(*args)
        window_title.wait_until_present(*args)
      end

      def present?
        window_title.present?
      end

      def text
        textarea.text
      end

      def ok
        ok_btn.click_while_present
      end
    end

    class ConfirmTransaction < Browser::BaseCache
      #assign({})

      def window_title
        cache[:window_title] = StampsField.new(browser.div(text: 'Confirm Transaction')) if cache[:window_title].nil? || !cache[:window_title].present?
        cache[:window_title]
      end

      def transaction_complete
        cache[:transaction_complete].nil? ? cache[:transaction_complete] = TransactionComplete.new(param) : cache[:transaction_complete]
      end

      def confirm_btn
        cache[:confirm_btn] = StampsField.new(browser.span(text: "Confirm")) if cache[:confirm_btn].nil? || !cache[:confirm_btn].present?
        cache[:confirm_btn]
      end

      def exit
        StampsField.new(browser.imgs(class: "x-tool-img x-tool-close").last).click_while_present
      end

      def present?
        window_title.present?
      end

      def wait_until_present(*args)
        window_title.wait_until_present(*args)
      end

      def textarea
        if param.web_app == :orders
          div = browser.div(class: 'sdc-dialoguemodal-confirm-purchase')
        elsif param.web_app == :mail
          div = browser.divs(css: "div[id^=dialoguemodal-][id$=-innerCt]").last
        else
          expect("Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test.").to eql "Invalid Value"
        end
        StampsField.new div
      end

      def text
        textarea.text
      end

      def confirm
        10.times do
          return transaction_complete if transaction_complete.present?
          confirm_btn.click
          transaction_complete.wait_until_present 6
        end
        expect("Unable to click Confirm button on Confirm Transaction modal!").to eql "Confirm Transaction Modal"
      end
    end

    class MinimumPurchaseAmountNotice < Browser::Base
      def present?

      end

      def text

      end

      def ok

      end
    end

    class AccountBalanceLimit < Browser::BaseCache
      #assign({})

      def body
        if cache[:body].nil? || !cache[:body].present?
               cache[:body] = StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=-body]>div>div[id^=dialoguemodal-][id$=-innerCt]"))
        end
        cache[:body]
      end

      def window_title
        cache[:window_title] = StampsField.new(browser.div(text: "Account Balance Limit")) if cache[:window_title].nil? || !cache[:window_title].present?
        cache[:window_title]
      end

      def present?
        window_title.present?
      end

      def text
        body.text
      end
    end

    class AutoBuyPostageModal < Browser::BaseCache
      #assign({})

      def window_title
        cache[:window_title] = StampsField.new(browser.div(text: "Add Funds")) if cache[:window_title].nil? || !cache[:window_title].present?
        cache[:window_title]
      end

      def present?
        window_title.present?
      end
    end

    class AddFundsModal < Browser::BaseCache
      #assign({})

      def confirm_transaction
        cache[:confirm_transaction].nil? ? cache[:confirm_transaction] = ConfirmTransaction.new(param) : cache[:confirm_transaction]
      end

      def auto_add_funds_modal
        cache[:auto_add_funds_modal].nil? ? cache[:auto_add_funds_modal] = AutoBuyPostageModal.new(param) : cache[:auto_add_funds_modal]
      end

      def auto_buy_postage_link
        if cache[:auto_buy_postage_link].nil? || !cache[:auto_buy_postage_link].present?
          cache[:auto_buy_postage_link] = StampsField.new(browser.span(text: "Auto-buy postage"))
        end
        cache[:auto_buy_postage_link]
      end

      def window_title
        if cache[:window_title].nil? || !cache[:window_title].present?
          cache[:window_title] = StampsField.new(browser.div(text: "Add Funds"))
        end
        cache[:window_title]
      end

      def account_balance_limit
        cache[:account_balance_limit].nil? ? cache[:account_balance_limit] = AccountBalanceLimit.new(param) : cache[:account_balance_limit]
      end

      def auto_buy_postage
        10.times do
          auto_buy_postage_link.click
          return auto_add_funds_modal if auto_add_funds_modal.present?
        end
        expect("Auto-Buy Postage modal did not open.").to eql "Unable to open Auto-Buy Postage modal upon clicking Auto-buy postage link"
      end
      #todo-Alex remove param.web_app check
      def purchase_button
        if param.web_app == :orders || param.web_app == :mail
          button = browser.span(id: "sdc-purchasewin-purchasebtn-btnInnerEl")
       # elsif param.web_app == :mail
        #  #button = browser.span(id: "sdc-purchasewin-purchasebtn-btnIconEl")
          #button = browser.span(id: "sdc-purchasewin-purchasebtn-btnInnerEl")
        else
          "raise Purchase Button failure. #{param.web_app} is not a valid value for param.web_app, check your test."
        end
        StampsField.new button
      end

      def present?
        window_title.present?
      end

      def buy_10
        param.web_app.should_not be nil
        checkbox_element = browser.label(css: "label[for=sdc-purchasewin-10dradio][id$=boxLabelEl]")
        verify_element = checkbox_element.parent.parent.parent
        attribute = "class"
        verify_element_attrib = "checked"
        StampsRadio.new(checkbox_element, verify_element, attribute, verify_element_attrib)
      end

      def buy_25
        checkbox_element = browser.label(css: "label[for=sdc-purchasewin-25dradio][id$=boxLabelEl]")
        verify_element = checkbox_element.parent.parent.parent
        attribute = "class"
        verify_element_attrib = "checked"
        StampsRadio.new(checkbox_element, verify_element, attribute, verify_element_attrib)
      end

      def buy_50
        checkbox_element = browser.label(css: "label[for=sdc-purchasewin-50dradio][id$=boxLabelEl]")
        verify_element = checkbox_element.parent.parent.parent
        attribute = "class"
        verify_element_attrib = "checked"
        StampsRadio.new(checkbox_element, verify_element, attribute, verify_element_attrib)
      end

      def buy_100
        checkbox_element = browser.label(css: "label[for=sdc-purchasewin-100dradio][id$=boxLabelEl]")
        verify_element = checkbox_element.parent.parent.parent
        attribute = "class"
        verify_element_attrib = "checked"
        StampsRadio.new(checkbox_element, verify_element, attribute, verify_element_attrib)
      end

      def buy_other value
        checkbox_element = browser.label(css: "label[for=sdc-purchasewin-otherdradio][id$=boxLabelEl]")
        verify_element = checkbox_element.parent.parent.parent
        attribute = "class"
        verify_element_attrib = "checked"
        checkbox = StampsRadio.new(checkbox_element, verify_element, attribute, verify_element_attrib)

        textbox = StampsTextbox.new(browser.text_field id: "sdc-purchasewin-otheramount")

        checkbox.select
        textbox.set(value)
      end

      def purchase
        return confirm_transaction if confirm_transaction.present?
        10.times do
          return confirm_transaction if confirm_transaction.present?
          purchase_button.click
          confirm_transaction.wait_until_present 5
          expect("#{account_balance_limit.window_title.text}:  #{account_balance_limit.text}").to eql "Confirm Transaction Modal" if account_balance_limit.present?
        end
      end

      def edit_payment_method
        raise 'Not Implemented'
      end

      def autobuy
        raise 'Not Implemented'
      end
    end

    class BalanceDropDown < Browser::BaseCache
      #assign({})

      def add_funds_modal
        cache[:add_funds_modal].nil? ? cache[:add_funds_modal] = AddFundsModal.new(param) : cache[:add_funds_modal]
      end

      def buy_more_dropdown
        if cache[:buy_more_dropdown].nil? || !cache[:buy_more_dropdown].present?
          cache[:buy_more_dropdown] = StampsField.new(browser.span(class: "balanceLabel"))
        end
        cache[:buy_more_dropdown]
      end

      def buy_more_link
        if cache[:buy_more_link].nil? || !cache[:buy_more_link].present?
          cache[:buy_more_link] = StampsField.new(browser.a(text: "Buy More"))
        end
        cache[:buy_more_link]
      end

      def view_history_link
        if cache[:view_history_link].nil? || !cache[:view_history_link].present?
          cache[:view_history_link] = StampsField.new(browser.a(text: "View Purchase History"))
        end
        cache[:view_history_link]
      end

      def balance_amount
        if cache[:balance_amount].nil? || !cache[:balance_amount].present?
          cache[:balance_amount] = StampsField.new(browser.span(id: 'postageBalanceAmt'))
        end
        cache[:balance_amount]
      end

      def buy_more
        20.times do
          return add_funds_modal if add_funds_modal.present?
          buy_more_dropdown.field.hover
          buy_more_dropdown.click unless buy_more_link.present?
          buy_more_dropdown.field.hover
          buy_more_link.click
          return add_funds_modal if add_funds_modal.present?
        end
        expect("Unable to open Buy Postage Modal").to eql "buy_more failed"
      end

      def purchase_history
        2.times do
          buy_more_dropdown.field.hover
          buy_more_dropdown.click unless view_history_link.present?
          buy_more_dropdown.field.hover
          view_history_link.click
        end
      end

      def new_balance(old_balance)
        10.times do
          break unless balance_text.dollar_amount_str.include? old_balance.to_s
          sleep(0.25)
        end
        balance_field.text.dollar_amount_str
      end
    end

    class UsernameDropDown < Browser::BaseCache
      #assign({})
      def cache
        self.class.cache
      end

      def username
        cache[:username].nil? ? cache[:username] = StampsField.new(browser.span id: 'userNameText') : cache[:username]
      end
      def sign_out_link
        cache[:sign_out_link].nil? ? cache[:sign_out_link] = StampsField.new(browser.a(text: "Sign Out")) : cache[:sign_out_link]
      end

      def present?
        username.present?
      end

      def wait_until_present(*args)
        username.wait_until_present(*args)
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
          sleep(0.35)
          username.click unless sign_out_link.present?
          username.hover
          sign_out_link.click if sign_out_link.present?
          sleep(0.35)
          return if browser.url.include? "SignIn"
        end
      end
    end

    class NavigationBar < Browser::BaseCache
      #assign({})

      def balance
        cache[:balance].nil? ? cache[:balance] = BalanceDropDown.new(param) : cache[:balance]
      end

      def username
        cache[:username].nil? ? cache[:username] = UsernameDropDown.new(param) : cache[:username]
      end

      def sign_out_link
        cache[:sign_out_link].nil? ? cache[:sign_out_link] = StampsField.new(browser.link(id: "signOutLink")) : cache[:sign_out_link]
      end

      def signed_in_username
        cache[:signed_in_username].nil? ? cache[:signed_in_username] = StampsField.new(browser.span(id: 'userNameText')) : cache[:signed_in_username]
      end
      def orders_link
        cache[:orders_link].nil? ? cache[:orders_link] = StampsField.new(browser.a(text: 'Orders')) : cache[:orders_link]
      end

      def mail_link
        cache[:mail_link].nil? ? cache[:mail_link] = StampsField.new(browser.a(text: 'Mail')) : cache[:mail_link]
      end

      def help_link
        cache[:help_link].nil? ? cache[:help_link] = StampsField.new(browser.a(text: 'Help')) : cache[:help_link]
      end

      def orders
        raise 'Not Implemented'
=begin
        10.times do
          orders_link.click
          web_orders.wait_until_present(8)
          return web_orders if grid.present?
        end
=end
      end

      def mail
        raise 'Not Implemented'
=begin
        10.times do
          mail_link.click
          web_mail.wait_until_present(8)
          return web_mail if grid.present?
        end
=end
      end

      def sign_out
        20.times do
          begin
            signed_in_username.click unless sign_out_link.present?
            sign_out_link.click
            sign_out_link.click
            signed_in_username.click unless sign_out_link.present?
            sign_out_link.click
            sleep(0.35)
            sign_out_link.click
            break unless signed_in_username.present?
          rescue
            #ignore
          end
        end
        logger.info "#{ENV["SIGNED_IN_USER"]}#{(signed_in_username.present?) ? " - sign-out failed" : " was signed out.  Goodbye."}"
      end

      def wait_until_present(*args)
        username.wait_until_present(*args)
      end

      def present?
        username.present?
      end

    end
  end
end