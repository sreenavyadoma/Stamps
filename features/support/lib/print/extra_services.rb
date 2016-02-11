# encoding: utf-8
module Print
  module Postage
    class ExtraServices < Print::Postage::PrintObject

      def close
        browser_helper.safe_click (@browser.img :css => "img[class*='x-tool-img x-tool-close']")
      end

      def wait_until_present
        window_title.wait_until_present
      end

      def present?
        window_title.present?
      end

      def save
        button = Button.new @browser.span :id => "sdc-extraservices-savebtn-btnIconEl"
        button.click
      end

      def window_title
         Label.new (@browser.span :text => "Extra Services")
      end

      def security
        Print::Postage::Security.new @browser
      end

      def security_value
        Print::Postage::SecurityValue.new @browser
      end

      def cod
        Print::Postage::COD.new @browser
      end

      def handling
        Print::Postage::Handling.new @browser
      end

      def return_receipt
        Print::Postage::ReturnReceipt.new @browser
      end

      def electronic_return_receipt
        Print::Postage::ElectronicReturnReceipt.new @browser
      end

      def restricted_delivery
        Print::Postage::RestrictedDelivery.new @browser
      end

      def non_delivery_notice
        Print::Postage::NonDeliveryNotice.new @browser
      end

      def fragile
        Print::Postage::Fragile.new @browser
      end

      def merchandise_return_receipt
        Print::Postage::MerchandiseReturnReceipt.new @browser
      end

      def non_rectangular
        Print::Postage::NonRectangular.new @browser
      end

      def special_contents_modal
        Print::Postage::SpecialContentsModal.new @browser
      end


    end

    class SpecialContentsModal < Print::Postage::PrintObject
      def window_x_button
        Button.new (@browser.imgs :css => "img[class*='x-tool-close']")[1]
      end

      def close_window
        browser_helper.click window_x_button, 'close_window'
      end

      def x_button_present?
        browser_helper.present? window_x_button
      end

      def wait_until_present
        begin
          window_x_button.wait_until_present
        rescue
          #ignore
        end
      end

      def window_title
        @browser.span :text => "Special Contents Warning"
      end

      def present?
        browser_helper.present? window_title
      end

      def save
        button = Button.new @browser.span :css => "span[id*=agreebtn-btnIconEl]"
        button.click
        sleep(2)
      end

    end

    class Security < Print::Postage::PrintObject
      def text_box
        Textbox.new @browser.text_field :name => "security"
      end

      def drop_down
        Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[9]
      end

      def select selection
        log.info "Select Security #{selection}"
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :text => selection
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            log.info "Selected Security #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        log.info "Security selected: #{selection}"
        selection_label
      end

      def price

      end

    end

    class SecurityValue < Print::Postage::PrintObject
      def text_box
        Textbox.new @browser.text_field :id => 'sdc-extraserviceswin-valuenumberfield-inputEl'
      end

      def set value
        self.text_box.set value
        log.info "Security Value set to #{text_box.text}"
        self.text_box.click
        sleep(2)
      end

      def increment value
        button = Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[8]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[8]
        value.to_i.times do
          button.safe_click
        end
      end

    end


    class COD < Print::Postage::PrintObject
      def text_box
        Textbox.new @browser.text_field :id => 'sdc-extraserviceswin-codnumberfield-inputEl'
      end

      def form_3816
        Button.new @browser.span :css => "span[id*=sdc-extraserviceswin-codformbtn-btnIconEl]"
      end

      def label
        Label.new @browser.label :text => 'COD:'
      end

      def set value

        5.times {
          begin
            self.text_box.set value
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
        button = Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[9]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[9]
        value.to_i.times do
          button.safe_click
        end
      end

    end

    class Handling < Print::Postage::PrintObject
      def text_box
        Textbox.new @browser.text_field :name => "contents"
      end

      def drop_down
        Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[11]
      end

      def select selection
        log.info "Select Handling: #{selection}"
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :text => selection
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            log.info "Selected Security #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        log.info "Handling selected: #{selection}"
        selection_label
      end

    end

    class ReturnReceipt < Print::Postage::PrintObject

      def checkbox
        checkbox_field = @browser.input :css => "input[id^=sdc-extraserviceswin-rrcheckbox-inputEl]"
        verify_field = @browser.table :css => "table[id^=sdc-extraserviceswin-rrcheckbox]"
        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end

    end

    class ElectronicReturnReceipt < Print::Postage::PrintObject
      def checkbox
        checkbox_field = @browser.input :css => "input[id^=sdc-extraserviceswin-rrecheckbox-inputEl]"
        verify_field = @browser.table :css => "table[id^=sdc-extraserviceswin-rrecheckbox]"
        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end

    end

    class RestrictedDelivery < Print::Postage::PrintObject
      def checkbox
        checkbox_field = @browser.input :css => "input[id^=sdc-extraserviceswin-rdcheckbox-inputEl]"
        verify_field = @browser.table :css => "table[id^=sdc-extraserviceswin-rdcheckbox]"
        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end


    class NonDeliveryNotice < Print::Postage::PrintObject
      def checkbox
        checkbox_field = @browser.input :css => "input[id^=sdc-extraserviceswin-nndcheckbox-inputEl]"
        verify_field = @browser.table :css => "table[id^=sdc-extraserviceswin-nndcheckbox]"
        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end


    class Fragile < Print::Postage::PrintObject
      def checkbox
        checkbox_field = @browser.input :css => "input[id^=sdc-extraserviceswin-shcheckbox-inputEl]"
        verify_field = @browser.table :css => "table[id^=sdc-extraserviceswin-shcheckbox]"
        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class MerchandiseReturnReceipt < Print::Postage::PrintObject
      def checkbox
        checkbox_field = @browser.input :css => "input[id^=sdc-extraserviceswin-rrmcheckbox-inputEl]"
        verify_field = @browser.table :css => "table[id^=sdc-extraserviceswin-rrmcheckbox]"
        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end

    class NonRectangular < Print::Postage::PrintObject
      def checkbox
        checkbox_field = @browser.input :css => "input[id^=sdc-extraservices-nreccheckbox]"
        verify_field = @browser.table :css => "table[id^=sdc-extraserviceswin-notrectangularcheckbox]"
        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end

      def price

      end
    end



  end
end





