module Stamps
  module Orders
    module Navigation
      class NavigationBar < Browser::Modal
        class BalanceDropDown < Browser::Modal
          def buy_more
            buy_postage_modal = Orders::Purchasing::BuyPostage.new param
            drop_down = ElementWrapper.new (browser.span class: "balanceLabel")
            link = ElementWrapper.new (browser.a text: "Buy More")
            20.times do
              drop_down.element.hover
              drop_down.safe_click unless link.present?
              drop_down.element.hover
              link.safe_click
              return buy_postage_modal if buy_postage_modal.present?
            end
          end

          def purchase_history
            drop_down = ElementWrapper.new (browser.span class: "balanceLabel")
            link = ElementWrapper.new (browser.a text: "View Purchase History")
            2.times do
              drop_down.element.hover
              drop_down.safe_click unless link.present?
              drop_down.element.hover
              link.safe_click
            end
          end

          def amount
            balance_field = ElementWrapper.new (browser.span id: 'postageBalanceAmt')
            10.times{
              amount = balance_field.text
              amount_stripped_dollar = amount.gsub("$","")
              amount_stripped_all = amount_stripped_dollar.gsub(",","")
              return amount_stripped_all if amount_stripped_all.length > 0
            }
          end

          def new_balance old_balance
            balance_field = ElementWrapper.new browser.span(id: 'postageBalanceAmt')
            10.times{
              balance = ParameterHelper.remove_dollar_sign balance_field.text
              break unless balance.include? old_balance.to_s
              sleep(1)
            }
            ParameterHelper.remove_dollar_sign balance_field.text
          end
        end

        class UsernameDropDown < Browser::Modal
          def present?
            username.present?
          end

          def text
            username.text
          end

          def username
            ElementWrapper.new browser.span Orders::Locators::NavBar.username
          end

          def manage_account

          end

          def home

          end

          def sign_out
            drop_down = username
            sign_out_link = browser.a text: "Sign Out"
            20.times do
              drop_down.safe_click unless sign_out_link.present?
              drop_down.element.hover
              element_helper.safe_click sign_out_link if sign_out_link.present?
              return if browser.url.include? "SignIn"
            end
          end
        end

        def balance
          BalanceDropDown.new param
        end

        def sign_out
          sign_out_link = ElementWrapper.new browser.link id: "signOutLink"
          signed_in_username = ElementWrapper.new browser.span id: 'userNameText'
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

        def username
          UsernameDropDown.new param
        end

        def wait_until_present *args
          wait_field = browser.span Orders::Locators::NavBar.username
          case args.length
            when 1
              wait_field.wait_until_present args[0].to_i
            else
              wait_field.wait_until_present
          end
        end

        def present?
          username.present?
        end

      end
    end
  end
end