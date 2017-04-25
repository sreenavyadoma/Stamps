module Stamps
  module Mail
    module PrintFormPanel
      class MailExtraServices < Browser::StampsModal
        attr_accessor :window_title, :security, :value, :handling, :save_element, :close_element, :security_price_element, :return_receipt_price_element,
                      :restricted_delivery_price_element, :cod_price_element, :non_delivery_notice_price_element, :content_price_element,
                      :special_handling_price_element, :merchandise_return_receipt_element, :total_price_element

        def initialize(param)
          super(param)
          @window_title = StampsElement.new(browser.div(text: "Extra Services"))
          text_boxes = browser.text_fields(id: "sdc-extraserviceswin-securitydroplist-inputEl")
          drop_downs = browser.divs(id: "sdc-extraserviceswin-securitydroplist-trigger-picker")
          @security = StampsComboBox.new(text_boxes, drop_downs, :li, 0)

          text_box = browser.text_field(id: "sdc-extraserviceswin-valuenumberfield-inputEl")
          inc_btn = browser.div(css: "div[id=sdc-extraserviceswin-valuenumberfield-trigger-spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id=sdc-extraserviceswin-valuenumberfield-trigger-spinner]>div[class*=down]")
          @value = StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_boxes = browser.text_fields(id: "sdc-extraserviceswin-contentdroplist-inputEl")
          drop_downs = browser.divs(id: "sdc-extraserviceswin-contentdroplist-trigger-picker")
          @handling = StampsComboBox.new(text_boxes, drop_downs, :li, 0)

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
          expect(close_element).not_to be_present
        end

        def save
          save_element.click_while_present
          expect(save_element).not_to be_present
        end

        def security_price
          expect(security_price_element).to be_present
          security_price_element.blur_out(3)
          helper.remove_dollar_sign(security_price_element.text).to_f.round(2)
        end

        def return_receipt_price
          expect(return_receipt_price_element).to be_present
          return_receipt_price_element.blur_out(3)
          helper.remove_dollar_sign(return_receipt_price_element.text).to_f.round(2)
        end

        def restricted_delivery_price
          expect(restricted_delivery_price_element).to be_present
          restricted_delivery_price_element.blur_out(3)
          helper.remove_dollar_sign(restricted_delivery_price_element.text).to_f.round(2)
        end

        def cod_price
          expect(cod_price_element).to be_present
          cod_price_element.blur_out(3)
          helper.remove_dollar_sign(cod_price_element.text).to_f.round(2)
        end

        def non_delivery_notice_price
          expect(non_delivery_notice_price_element).to be_present
          non_delivery_notice_price_element.blur_out(3)
          helper.remove_dollar_sign(non_delivery_notice_price_element.text).to_f.round(2)
        end

        def content_price
          expect(content_price_element).to be_present
          content_price_element.blur_out(3)
          helper.remove_dollar_sign(content_price_element.text).to_f.round(2)
        end

        def special_handling_price
          expect(special_handling_price_element).to be_present
          special_handling_price_element.blur_out(3)
          helper.remove_dollar_sign(special_handling_price_element.text).to_f.round(2)
        end

        def merchandise_return_receipt
          expect(merchandise_return_receipt_element).to be_present
          merchandise_return_receipt_element.blur_out(3)
          helper.remove_dollar_sign(merchandise_return_receipt_element.text).to_f.round(2)
        end

        def total_price
          expect(total_price_element).to be_present
          total_price_element.blur_out(3)
          helper.remove_dollar_sign(total_price_element.text).to_f.round(2)
        end

        def return_receipt
          if @return_receipt.nil? || !@return_receipt.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-rrcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-rrcheckbox')
            @return_receipt = StampsCheckbox.new(checkbox, verify, "class", "checked")
          end
          @return_receipt
        end

        def restricted_delivery
          if @restricted_delivery.nil? || !@restricted_delivery.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-rdcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-rdcheckbox')
            @restricted_delivery = StampsCheckbox.new(checkbox, verify, "class", "checked")
          end
          @restricted_delivery
        end

        def cod
          if @cod.nil? || !@cod.present?
            text_box = browser.text_field(id: "sdc-extraserviceswin-codnumberfield-inputEl")
            inc_btn = browser.div(css: "div[id=sdc-extraserviceswin-codnumberfield-trigger-spinner]>div[class*=up]")
            dec_btn = browser.divs(css: "div[id=sdc-extraserviceswin-codnumberfield-trigger-spinner]>div[class*=down]")
            @cod = StampsNumberField.new(text_box, inc_btn, dec_btn)
          end
          @cod
        end

        def non_delivery_notice
          if @non_delivery_notice.nil? || !@non_delivery_notice.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-nndcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-nndcheckbox')
            @non_delivery_notice = StampsCheckbox.new(checkbox, verify, "class", "checked")
          end
          @non_delivery_notice
        end

        def fragile
          if @fragile.nil? || !@fragile.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-shcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-shcheckbox')
            @fragile = StampsCheckbox.new(checkbox, verify, "class", "checked")
          end
          @fragile
        end

        def non_rectangular
          if @non_rectangular.nil? || !@non_rectangular.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-notrectangularcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-notrectangularcheckbox')
            @non_rectangular = StampsCheckbox.new(checkbox, verify, "class", "checked")
          end
          @non_rectangular
        end

        def return_receipt_merchandise
          if @return_receipt_merchandise.nil? || !@return_receipt_merchandise.present?
            checkbox = browser.span(id: "sdc-extraserviceswin-rrmcheckbox-displayEl")
            verify = browser.div(id: 'sdc-extraserviceswin-rrmcheckbox')
            @return_receipt_merchandise = StampsCheckbox.new(checkbox, verify, "class", "checked")
          end
          @return_receipt_merchandise
        end
      end
    end
  end
end
