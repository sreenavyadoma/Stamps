module Stamps
  module Mail
    module PrintFormPanel
      class MailExtraServices < Browser::StampsModal
        attr_accessor :window_title, :security, :value, :handling, :save_element, :close_element, :security_price_element, :return_receipt_price_element,
                      :restricted_delivery_price_element, :cod_price_element, :non_delivery_notice_price_element, :content_price_element,
                      :special_handling_price_element, :merchandise_return_receipt_element, :total_price_element

        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(text: "Extra Services"))
          textboxes = browser.text_fields(id: "sdc-extraserviceswin-securitydroplist-inputEl")
          dropdowns = browser.divs(id: "sdc-extraserviceswin-securitydroplist-trigger-picker")
          @security = StampsComboBox.new(textboxes, dropdowns, :li, 0)

          textbox = browser.text_field(id: "sdc-extraserviceswin-valuenumberfield-inputEl")
          inc_btn = browser.div(css: "div[id=sdc-extraserviceswin-valuenumberfield-trigger-spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id=sdc-extraserviceswin-valuenumberfield-trigger-spinner]>div[class*=down]")
          @value = StampsNumberField.new(textbox, inc_btn, dec_btn)

          textboxes = browser.text_fields(id: "sdc-extraserviceswin-contentdroplist-inputEl")
          dropdowns = browser.divs(id: "sdc-extraserviceswin-contentdroplist-trigger-picker")
          @handling = StampsComboBox.new(textboxes, dropdowns, :li, 0)

          @save_element = StampsElement.new(browser.span(id: "sdc-extraservices-savebtn-btnInnerEl"))
          @close_element = StampsElement.new(browser.img(css: "img[class*='x-tool-img x-tool-close']"))

          @security_price_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-securitypricelabel"))
          @return_receipt_price_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-rrpricelabel"))
          @restricted_delivery_price_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-rdpricelabel"))
          @cod_price_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-codpricelabel"))
          @non_delivery_notice_price_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-nndpricelabel"))
          @content_price_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-contentpricelabel"))
          @special_handling_price_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-shpricelabel"))
          @merchandise_return_receipt_element = StampsElement.new(browser.label(id: "sdc-extraserviceswin-rrmpricelabel"))
          @total_price_element = StampsElement.new(browser.label(id: "sdc-extraservices-totalcostlabel"))
        end

        def present?
          window_title.present?
        end

        def close
          close_element.click_while_present
          expect(close_element.present?).not_to be(true)
        end

        def save
          save_element.click_while_present
          expect(save_element.present?).not_to be(true)
        end

        def security_price
          expect(security_price_element).to be_present
          security_price_element.blur_out(3)
          test_helper.dollar_amount_str(security_price_element.text).to_f.round(2)
        end

        def return_receipt_price
          expect(return_receipt_price_element).to be_present
          return_receipt_price_element.blur_out(3)
          test_helper.dollar_amount_str(return_receipt_price_element.text).to_f.round(2)
        end

        def restricted_delivery_price
          expect(restricted_delivery_price_element).to be_present
          restricted_delivery_price_element.blur_out(3)
          test_helper.dollar_amount_str(restricted_delivery_price_element.text).to_f.round(2)
        end

        def cod_price
          expect(cod_price_element).to be_present
          cod_price_element.blur_out(3)
          test_helper.dollar_amount_str(cod_price_element.text).to_f.round(2)
        end

        def non_delivery_notice_price
          expect(non_delivery_notice_price_element).to be_present
          non_delivery_notice_price_element.blur_out(3)
          test_helper.dollar_amount_str(non_delivery_notice_price_element.text).to_f.round(2)
        end

        def content_price
          expect(content_price_element).to be_present
          content_price_element.blur_out(3)
          test_helper.dollar_amount_str(content_price_element.text).to_f.round(2)
        end

        def special_handling_price
          expect(special_handling_price_element).to be_present
          special_handling_price_element.blur_out(3)
          test_helper.dollar_amount_str(special_handling_price_element.text).to_f.round(2)
        end

        def merchandise_return_receipt
          expect(merchandise_return_receipt_element).to be_present
          merchandise_return_receipt_element.blur_out(3)
          test_helper.dollar_amount_str(merchandise_return_receipt_element.text).to_f.round(2)
        end

        def total_price
          expect(total_price_element).to be_present
          total_price_element.blur_out(3)
          test_helper.dollar_amount_str(total_price_element.text).to_f.round(2)
        end

        def return_receipt
          if @return_receipt.nil? || !@return_receipt.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-rrcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-rrcheckbox')
            @return_receipt = StampsCheckBox.new(checkbox, verify, "class", "checked")
          end
          @return_receipt
        end

        def restricted_delivery
          if @restricted_delivery.nil? || !@restricted_delivery.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-rdcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-rdcheckbox')
            @restricted_delivery = StampsCheckBox.new(checkbox, verify, "class", "checked")
          end
          @restricted_delivery
        end

        def cod
          if @cod.nil? || !@cod.present?
            textbox = browser.text_field(id: "sdc-extraserviceswin-codnumberfield-inputEl")
            inc_btn = browser.div(css: "div[id=sdc-extraserviceswin-codnumberfield-trigger-spinner]>div[class*=up]")
            dec_btn = browser.div(css: "div[id=sdc-extraserviceswin-codnumberfield-trigger-spinner]>div[class*=down]")
            @cod = StampsNumberField.new(textbox, inc_btn, dec_btn)
          end
          @cod
        end

        def non_delivery_notice
          if @non_delivery_notice.nil? || !@non_delivery_notice.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-nndcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-nndcheckbox')
            @non_delivery_notice = StampsCheckBox.new(checkbox, verify, "class", "checked")
          end
          @non_delivery_notice
        end

        def fragile
          if @fragile.nil? || !@fragile.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-shcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-shcheckbox')
            @fragile = StampsCheckBox.new(checkbox, verify, "class", "checked")
          end
          @fragile
        end

        def non_rectangular
          if @non_rectangular.nil? || !@non_rectangular.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-notrectangularcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-notrectangularcheckbox')
            @non_rectangular = StampsCheckBox.new(checkbox, verify, "class", "checked")
          end
          @non_rectangular
        end

        def return_receipt_merchandise
          if @return_receipt_merchandise.nil? || !@return_receipt_merchandise.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-rrmcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-rrmcheckbox')
            @return_receipt_merchandise = StampsCheckBox.new(checkbox, verify, "class", "checked")
          end
          @return_receipt_merchandise
        end
      end
    end
  end
end
