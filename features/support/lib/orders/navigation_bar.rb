module Orders
  module Navigation
    class NavigationBar < OrdersObject
      class BalanceDropDown < OrdersObject
        def buy_more
          buy_postage_modal = Orders::Purchasing::BuyPostage.new @browser
          drop_down = StampsButton.new (@browser.span :class => "balanceLabel")
          link = Label.new (@browser.a :text => "Buy More")
          20.times do
            drop_down.hover
            drop_down.safe_click unless link.present?
            drop_down.hover
            link.safe_click
            return buy_postage_modal if buy_postage_modal.present?
          end
        end

        def purchase_history
          drop_down = StampsButton.new (@browser.span :class => "balanceLabel")
          link = Label.new (@browser.a :text => "View Purchase History")
          2.times do
            drop_down.hover
            drop_down.safe_click unless link.present?
            drop_down.hover
            link.safe_click
          end
        end

        def amount
          balance_field = Label.new (@browser.span :id => 'postageBalanceAmt')
          10.times{
            amount = balance_field.text
            amount_stripped_dollar = amount.gsub("$","")
            amount_stripped_all = amount_stripped_dollar.gsub(",","")
            return amount_stripped_all if amount_stripped_all.length > 0
          }
        end

        def new_balance old_balance
          balance_field = Label.new @browser.span(id: 'postageBalanceAmt')
          10.times{
            balance = test_helper.remove_dollar_sign balance_field.text
            break unless balance.include? old_balance.to_s
            sleep(1)
          }
          test_helper.remove_dollar_sign balance_field.text
        end
      end

      class UsernameDropDown < OrdersObject
        def text
          username.text
        end

        def username
          Label.new @browser.span Orders::Locators::NavBar.username
        end

        def manage_account

        end

        def home

        end

        def sign_out
          drop_down = username
          sign_out_link = Label.new (@browser.a :text => "Sign Out")
          20.times do
            drop_down.safe_click unless sign_out_link.present?
            drop_down.hover
            sign_out_link.safe_click if sign_out_link.present?
            return if @browser.url.include? "SignIn"
          end
        end

      end

      def balance
        BalanceDropDown.new @browser
      end

      def sign_out
        sign_out_link = Link.new @browser.link :id => "signOutLink"
        signed_in_username = Label.new @browser.span :id => 'userNameText'
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
        log.info "#{ENV["SIGNED_IN_USER"]}#{(signed_in_username.present?)?" - sign-out failed":" was signed out.  Goodbye."}"
      end

      def username
        UsernameDropDown.new @browser
      end

      def wait_until_present *args
        wait_field = @browser.span Orders::Locators::NavBar.username
        case args.length
          when 0
            browser_helper.wait_until_present wait_field
          when 1
            browser_helper.wait_until_present wait_field args[0].to_i
          else
            raise "Wrong number of arguments."
        end
      end

      def present?
        browser_helper.present? @browser.span(Orders::Locators::NavBar.username)
      end

    end
  end
end