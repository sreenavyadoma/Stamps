module Stamps
  module Mail
    module PrintFormPanel
      class MailExtraServices < WebApps::Base #todo-Rob implement caching MailExtraServices
        attr_accessor :window_title, :security, :value, :handling, :save_field, :close_field, :security_price_field, :return_receipt_price_field,
                      :restricted_delivery_price_field, :cod_price_field, :non_delivery_notice_price_field, :content_price_field,
                      :special_handling_price_field, :merchandise_return_receipt_field, :total_price_field

        def initialize(param)
          super
          @window_title = StampsField.new(driver.div(text: "Extra Services"))
          textboxes = driver.text_fields(id: "sdc-extraserviceswin-securitydroplist-inputEl")
          dropdowns = driver.divs(id: "sdc-extraserviceswin-securitydroplist-trigger-picker")
          @security = StampsCombobox.new(textboxes, dropdowns, :li, 0)

          textbox = driver.text_field(id: "sdc-extraserviceswin-valuenumberfield-inputEl")
          inc_btn = driver.div(css: "div[id=sdc-extraserviceswin-valuenumberfield-trigger-spinner]>div[class*=up]")
          dec_btn = driver.div(css: "div[id=sdc-extraserviceswin-valuenumberfield-trigger-spinner]>div[class*=down]")
          @value = StampsNumberField.new(textbox, inc_btn, dec_btn)

          textboxes = driver.text_fields(id: "sdc-extraserviceswin-contentdroplist-inputEl")
          dropdowns = driver.divs(id: "sdc-extraserviceswin-contentdroplist-trigger-picker")
          @handling = StampsCombobox.new(textboxes, dropdowns, :li, 0)

          # @save_field = StampsField.new(driver.span(id: "sdc-extraservices-savebtn-btnInnerEl"))
          @save_field = StampsField.new(driver.span(id: "sdc-extraservices-savebtn-btnWrap"))
          @close_field = StampsField.new(driver.img(css: "img[class*='x-tool-img x-tool-close']"))

          @security_price_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-securitypricelabel"))
          @return_receipt_price_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-rrpricelabel"))
          @restricted_delivery_price_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-rdpricelabel"))
          @cod_price_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-codpricelabel"))
          @non_delivery_notice_price_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-nndpricelabel"))
          @content_price_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-contentpricelabel"))
          @special_handling_price_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-shpricelabel"))
          @merchandise_return_receipt_field = StampsField.new(driver.label(id: "sdc-extraserviceswin-rrmpricelabel"))
          @total_price_field = StampsField.new(driver.label(id: "sdc-extraservices-totalcostlabel"))
        end

        def present?
          window_title.present?
        end

        def close
          close_field.click_while_present
          expect(close_field.present?).not_to be(true)
        end

        def save
          save_field.click_while_present
          expect(save_field.present?).not_to be(true)
        end

        def security_price
          expect(security_price_field).to be_present
          security_price_field.blur_out(3)
          security_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def return_receipt_price
          expect(return_receipt_price_field).to be_present
          return_receipt_price_field.blur_out(3)
          return_receipt_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def restricted_delivery_price
          expect(restricted_delivery_price_field).to be_present
          restricted_delivery_price_field.blur_out(3)
          restricted_delivery_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def cod_price
          expect(cod_price_field).to be_present
          cod_price_field.blur_out(3)
          cod_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def non_delivery_notice_price
          expect(non_delivery_notice_price_field).to be_present
          non_delivery_notice_price_field.blur_out(3)
          non_delivery_notice_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def content_price
          expect(content_price_field).to be_present
          content_price_field.blur_out(3)
          content_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def special_handling_price
          expect(special_handling_price_field).to be_present
          special_handling_price_field.blur_out(3)
          special_handling_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def merchandise_return_receipt
          expect(merchandise_return_receipt_field).to be_present
          merchandise_return_receipt_field.blur_out(3)
          merchandise_return_receipt_field.text.dollar_amount_str.to_f.round(2)
        end

        def total_price
          expect(total_price_field).to be_present
          total_price_field.blur_out(3)
          total_price_field.text.dollar_amount_str.to_f.round(2)
        end

        def return_receipt
          if @return_receipt.nil? || !@return_receipt.present?
            checkbox = driver.span(id: "sdc-extraserviceswin-rrcheckbox-displayEl")
            verify = driver.div(id: 'sdc-extraserviceswin-rrcheckbox')
            @return_receipt = StampsCheckbox.new(checkbox, verify, 'class', 'checked')
          end
          @return_receipt
        end

        def electronic_return_receipt
          if @electronic_return_receipt.nil? || !@electronic_return_receipt.present?
            checkbox = driver.span(id: "sdc-extraserviceswin-rrecheckbox-displayEl")
            verify = driver.div(id: 'sdc-extraserviceswin-rrecheckbox')
            @electronic_return_receipt = StampsCheckbox.new(checkbox, verify, 'class', 'checked')
          end
          @electronic_return_receipt
        end

        def restricted_delivery
          if @restricted_delivery.nil? || !@restricted_delivery.present?
            checkbox = driver.span(id: "sdc-extraserviceswin-rdcheckbox-displayEl")
            verify = driver.div(id: 'sdc-extraserviceswin-rdcheckbox')
            @restricted_delivery = StampsCheckbox.new(checkbox, verify, 'class', 'checked')
          end
          @restricted_delivery
        end

        def cod
          if @cod.nil? || !@cod.present?
            textbox = driver.text_field(id: "sdc-extraserviceswin-codnumberfield-inputEl")
            inc_btn = driver.div(css: "div[id=sdc-extraserviceswin-codnumberfield-trigger-spinner]>div[class*=up]")
            dec_btn = driver.div(css: "div[id=sdc-extraserviceswin-codnumberfield-trigger-spinner]>div[class*=down]")
            @cod = StampsNumberField.new(textbox, inc_btn, dec_btn)
          end
          @cod
        end

        def non_delivery_notice
          if @non_delivery_notice.nil? || !@non_delivery_notice.present?
            checkbox = driver.span(id: "sdc-extraserviceswin-nndcheckbox-displayEl")
            verify = driver.div(id: 'sdc-extraserviceswin-nndcheckbox')
            @non_delivery_notice = StampsCheckbox.new(checkbox, verify, 'class', 'checked')
          end
          @non_delivery_notice
        end

        def fragile
          if @fragile.nil? || !@fragile.present?
            checkbox = driver.span(id: "sdc-extraserviceswin-shcheckbox-displayEl")
            verify = driver.div(id: 'sdc-extraserviceswin-shcheckbox')
            @fragile = StampsCheckbox.new(checkbox, verify, 'class', 'checked')
          end
          @fragile
        end

        def non_rectangular
          if @non_rectangular.nil? || !@non_rectangular.present?
            checkbox = driver.span(id: "sdc-extraserviceswin-notrectangularcheckbox-displayEl")
            verify = driver.div(id: 'sdc-extraserviceswin-notrectangularcheckbox')
            @non_rectangular = StampsCheckbox.new(checkbox, verify, 'class', 'checked')
          end
          @non_rectangular
        end

        def return_receipt_merchandise
          if @return_receipt_merchandise.nil? || !@return_receipt_merchandise.present?
            checkbox = driver.span(id: "sdc-extraserviceswin-rrmcheckbox-displayEl")
            verify = driver.div(id: 'sdc-extraserviceswin-rrmcheckbox')
            @return_receipt_merchandise = StampsCheckbox.new(checkbox, verify, 'class', 'checked')
          end
          @return_receipt_merchandise
        end
      end

      class ValueMustBeShown < WebApps::Base #This class represents the Postage Value Must be Shown modal. It appears when hidden postage has been checked and the user tries to add an extra service that is incompatible with hidden postage

        def continue
          (cache[:continue].nil? || !cache[:continue].present?) ? cache[:continue] = StampsField.new(driver.span(text: "Continue")) : cache[:continue]
        end

        def cancel
          (cache[:cancel].nil? || !cache[:cancel].present?) ? cache[:cancel] = StampsField.new(driver.span(text: "Cancel")) : cache[:cancel]
        end
      end

      ##
      # This class represents the Special Contents Warning modal. It appears when the extra service "Live Animal" or "live Animal (with fee)" is selected
      class SpecialContentsWarning < WebApps::Base
        def i_agree
          (cache[:i_agree].nil? || !cache[:i_agree].present?) ? cache[:i_agree] = StampsField.new(
              driver.span(text: "I Agree")) : cache[:i_agree]
        end

        def cancel
          (cache[:more_info].nil? || !cache[:more_info].present?) ? cache[:more_info] = StampsField.new(
              driver.a(text: "More Info")) : cache[:more_info]
        end
      end
    end
  end
end
