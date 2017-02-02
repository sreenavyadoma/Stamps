# encoding: utf-8
module Stamps
  module Mail
    class ExtraServices < Browser::Modal

      def close
        element_helper.safe_click (browser.img css: "img[class*='x-tool-img x-tool-close']")
      end

      def wait_until_present *args
        window_title.wait_until_present *args
      end

      def present?
        window_title.present?
      end

      def save
        button = StampsElement.new browser.span id: "sdc-extraservices-savebtn-btnIconEl"
        button.click
      end

      def window_title
        StampsElement.new(browser.span text: "Extra Services")
      end

      def security
        Security.new(param)
      end

      def security_value
        SecurityValue.new(param)
      end

      def cod
        COD.new(param)
      end

      def handling
        Handling.new(param)
      end

      def return_receipt
        ReturnReceipt.new(param)
      end

      def electronic_return_receipt
        ElectronicReturnReceipt.new(param)
      end

      def restricted_delivery
        RestrictedDelivery.new(param)
      end

      def non_delivery_notice
        NonDeliveryNotice.new(param)
      end

      def fragile
        Fragile.new(param)
      end

      def merchandise_return_receipt
        MerchandiseReturnReceipt.new(param)
      end

      def non_rectangular
        NonRectangular.new(param)
      end

      def special_contents_modal
        SpecialContentsModal.new(param)
      end


    end

    class SpecialContentsModal < Browser::Modal
      def window_x_button
        StampsElement.new(browser.imgs(css: "img[class*='x-tool-close']")[1])
      end

      def close_window
        element_helper.safe_click window_x_button
      end

      def x_button_present?
        window_x_button.present?
      end

      def wait_until_present
        begin
          window_x_button.wait_until_present
        rescue
          #ignore
        end
      end

      def window_title
        browser.span text: "Special Contents Warning"
      end

      def present?
        window_title.present?
      end

      def save
        button = StampsElement.new browser.span css: "span[id*=agreebtn-btnIconEl]"
        button.click
        sleep(2)
      end
    end

    class Security < Browser::Modal
      def text_box
        StampsTextbox.new browser.text_field name: "security"
      end

      def drop_down
        StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[9])
      end

      def select(selection)
        logger.info "Select Security #{selection}"
        box = text_box
        button = drop_down
        selection_label = StampsElement.new browser.div text: selection
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            logger.info "Selected Security #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        logger.info "Security selected: #{selection}"
        selection_label
      end

      def price

      end
    end

    class SecurityValue < Browser::Modal
      def text_box
        StampsTextbox.new browser.text_field id: 'sdc-extraserviceswin-valuenumberfield-inputEl'
      end

      def set(value)
        self.text_box.set(value)
        logger.info "Security Value set to #{text_box.text}"
        self.text_box.click
        sleep(2)
      end

      def increment value
        button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[8])
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[8])
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class COD < Browser::Modal
      def text_box
        StampsTextbox.new(browser.text_field(id: 'sdc-extraserviceswin-codnumberfield-inputEl'))
      end

      def form_3816
        StampsElement.new(browser.span(css: "span[id*=sdc-extraserviceswin-codformbtn-btnIconEl]"))
      end

      def label
        StampsElement.new(browser.label(text: 'COD:'))
      end

      def set(value)

        5.times {
          begin
            self.text_box.set(value)
            self.label.click

            break if form_3816.present?
            self.increment 1
            self.decrement 1
            break if form_3816.present?
          rescue
            #ignore
          end
        }

      end

      def increment value
        button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[9])
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[9])
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class Handling < Browser::Modal
      def text_box
        StampsTextbox.new browser.text_field(name: "contents")
      end

      def drop_down
        StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[11])
      end

      def select(selection)
        logger.info "Select Handling: #{selection}"
        box = text_box
        button = drop_down
        selection_label = StampsElement.new(browser.div(text: selection))
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            logger.info "Selected Security #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        logger.info "Handling selected: #{selection}"
        selection_label
      end
    end

    class ReturnReceipt < Browser::Modal
      def checkbox
        checkbox_field = browser.text_field css: "input[id^=sdc-extraserviceswin-rrcheckbox-inputEl]"
        verify_field = browser.table css: "table[id^=sdc-extraserviceswin-rrcheckbox]"
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class ElectronicReturnReceipt < Browser::Modal
      def checkbox
        checkbox_field = browser.text_field css: "input[id^=sdc-extraserviceswin-rrecheckbox-inputEl]"
        verify_field = browser.table css: "table[id^=sdc-extraserviceswin-rrecheckbox]"
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class RestrictedDelivery < Browser::Modal
      def checkbox
        checkbox_field = browser.text_field css: "input[id^=sdc-extraserviceswin-rdcheckbox-inputEl]"
        verify_field = browser.table css: "table[id^=sdc-extraserviceswin-rdcheckbox]"
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class NonDeliveryNotice < Browser::Modal
      def checkbox
        checkbox_field = browser.text_field css: "input[id^=sdc-extraserviceswin-nndcheckbox-inputEl]"
        verify_field = browser.table css: "table[id^=sdc-extraserviceswin-nndcheckbox]"
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class Fragile < Browser::Modal
      def checkbox
        checkbox_field = browser.text_field css: "input[id^=sdc-extraserviceswin-shcheckbox-inputEl]"
        verify_field = browser.table css: "table[id^=sdc-extraserviceswin-shcheckbox]"
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class MerchandiseReturnReceipt < Browser::Modal
      def checkbox
        checkbox_field = browser.text_field css: "input[id^=sdc-extraserviceswin-rrmcheckbox-inputEl]"
        verify_field = browser.table css: "table[id^=sdc-extraserviceswin-rrmcheckbox]"
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class NonRectangular < Browser::Modal
      def checkbox
        checkbox_field = browser.text_field css: "input[id^=sdc-extraservices-nreccheckbox]"
        verify_field = browser.table css: "table[id^=sdc-extraserviceswin-notrectangularcheckbox]"
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end
  end
end





