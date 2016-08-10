module Stamps
  module Orders
    module Purchasing
      class PurchaseApproved < Browser::Modal
        def present?
          (browser.div text: "Purchase Approved").present?
        end

        def ok
          button = ElementWrapper.new ((browser.spans text: 'OK').last)
          sleep 2
          button.click_while_present
        end
      end

      class ConfirmPurchase < Browser::Modal

        def exit
          button = ElementWrapper.new (browser.imgs class: "x-tool-img x-tool-close").last
          button.click_while_present
        end

        def present?
          (browser.div text: 'Confirm Purchase').present?
        end

        def purchase
          button = ElementWrapper.new (browser.spans text: "Purchase").last
          purchase_approved = PurchaseApproved.new param

          10.times do
            button.safe_click
            sleep 2
            return purchase_approved if purchase_approved.present?
          end
        end


      end

      class BuyPostage < Browser::Modal

        def present?
          (browser.div text: "Buy Postage").present?
        end

        def confirm_postage
          ConfirmPurchase.new param
        end

        def buy_10
          checkbox_field = (browser.input id: "sdc-purchasewin-10dradio").parent.span
          verify_field = (browser.input id: "sdc-purchasewin-10dradio").parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          CheckboxElement.new checkbox_field, verify_field, attribute, verify_field_attrib
        end

        def buy_25
          checkbox_field = (browser.input id: "sdc-purchasewin-25dradio").parent.span
          verify_field = (browser.input id: "sdc-purchasewin-25dradio").parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          CheckboxElement.new checkbox_field, verify_field, attribute, verify_field_attrib
        end

        def buy_50
          checkbox_field = (browser.input id: "sdc-purchasewin-50dradio").parent.span
          verify_field = (browser.input id: "sdc-purchasewin-50dradio").parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          CheckboxElement.new checkbox_field, verify_field, attribute, verify_field_attrib
        end

        def buy_100
          checkbox_field = (browser.input id: "sdc-purchasewin-100dradio").parent.span
          verify_field = (browser.input id: "sdc-purchasewin-100dradio").parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          CheckboxElement.new checkbox_field, verify_field, attribute, verify_field_attrib
        end

        def buy_other value
          checkbox_field = (browser.input id: "sdc-purchasewin-otherdradio").parent.span
          verify_field = (browser.input id: "sdc-purchasewin-otherdradio").parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          checkbox = CheckboxElement.new checkbox_field, verify_field, attribute, verify_field_attrib
          textbox = TextBoxElement.new (browser.text_field id: "sdc-purchasewin-otheramount")

          checkbox.check
          textbox.set value
        end

        def purchase
          button = ElementWrapper.new (browser.span id: "sdc-purchasewin-purchasebtn-btnInnerEl")
          confirm_purchase = ConfirmPurchase.new param
          10.times do
            button.safe_click
            sleep 1
            return confirm_purchase if confirm_purchase.present?
          end
        end

        def edit_payment_method
          stop_test "Edit Payment Method is not yet implemented."
        end

        def autobuy
          stop_test "AutoBuy is not implemented"
        end
      end
    end
  end
end