# encoding: utf-8
module Stamps
  module Print
    module Postage
      class ExtraServices < Browser::Modal

        def close
          browser_helper.safe_click (browser.img :css => "img[class*='x-tool-img x-tool-close']")
        end

        def wait_until_present
          window_title.wait_until_present
        end

        def present?
          window_title.present?
        end

        def save
          button = BrowserElement.new browser.span :id => "sdc-extraservices-savebtn-btnIconEl"
          button.click
        end

        def window_title
          BrowserElement.new (browser.span :text => "Extra Services")
        end

        def security
          Print::Postage::Security.new param
        end

        def security_value
          Print::Postage::SecurityValue.new param
        end

        def cod
          Print::Postage::COD.new param
        end

        def handling
          Print::Postage::Handling.new param
        end

        def return_receipt
          Print::Postage::ReturnReceipt.new param
        end

        def electronic_return_receipt
          Print::Postage::ElectronicReturnReceipt.new param
        end

        def restricted_delivery
          Print::Postage::RestrictedDelivery.new param
        end

        def non_delivery_notice
          Print::Postage::NonDeliveryNotice.new param
        end

        def fragile
          Print::Postage::Fragile.new param
        end

        def merchandise_return_receipt
          Print::Postage::MerchandiseReturnReceipt.new param
        end

        def non_rectangular
          Print::Postage::NonRectangular.new param
        end

        def special_contents_modal
          Print::Postage::SpecialContentsModal.new param
        end


      end

      class SpecialContentsModal < Browser::Modal
        def window_x_button
          BrowserElement.new (browser.imgs :css => "img[class*='x-tool-close']")[1]
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
          browser.span :text => "Special Contents Warning"
        end

        def present?
          browser_helper.present? window_title
        end

        def save
          button = BrowserElement.new browser.span :css => "span[id*=agreebtn-btnIconEl]"
          button.click
          sleep(2)
        end

      end

      class Security < Browser::Modal
        def text_box
          BrowserTextBox.new browser.text_field :name => "security"
        end

        def drop_down
          BrowserElement.new (browser.divs :css => "div[class*=x-form-arrow-trigger]")[9]
        end

        def select selection
          logger.info "Select Security #{selection}"
          box = text_box
          button = drop_down
          selection_label = BrowserElement.new browser.div :text => selection
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
          BrowserTextBox.new browser.text_field :id => 'sdc-extraserviceswin-valuenumberfield-inputEl'
        end

        def set value
          self.text_box.set value
          logger.info "Security Value set to #{text_box.text}"
          self.text_box.click
          sleep(2)
        end

        def increment value
          button = BrowserElement.new (browser.divs :css => "div[class*=x-form-spinner-up]")[8]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.divs :css => "div[class*=x-form-spinner-down]")[8]
          value.to_i.times do
            button.safe_click
          end
        end

      end


      class COD < Browser::Modal
        def text_box
          BrowserTextBox.new browser.text_field :id => 'sdc-extraserviceswin-codnumberfield-inputEl'
        end

        def form_3816
          BrowserElement.new browser.span :css => "span[id*=sdc-extraserviceswin-codformbtn-btnIconEl]"
        end

        def label
          BrowserElement.new browser.label :text => 'COD:'
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
          button = BrowserElement.new (browser.divs :css => "div[class*=x-form-spinner-up]")[9]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.divs :css => "div[class*=x-form-spinner-down]")[9]
          value.to_i.times do
            button.safe_click
          end
        end

      end

      class Handling < Browser::Modal
        def text_box
          BrowserTextBox.new browser.text_field :name => "contents"
        end

        def drop_down
          BrowserElement.new (browser.divs :css => "div[class*=x-form-arrow-trigger]")[11]
        end

        def select selection
          logger.info "Select Handling: #{selection}"
          box = text_box
          button = drop_down
          selection_label = BrowserElement.new browser.div :text => selection
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
          checkbox_field = browser.input :css => "input[id^=sdc-extraserviceswin-rrcheckbox-inputEl]"
          verify_field = browser.table :css => "table[id^=sdc-extraserviceswin-rrcheckbox]"
          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def price

        end

      end

      class ElectronicReturnReceipt < Browser::Modal
        def checkbox
          checkbox_field = browser.input :css => "input[id^=sdc-extraserviceswin-rrecheckbox-inputEl]"
          verify_field = browser.table :css => "table[id^=sdc-extraserviceswin-rrecheckbox]"
          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def price

        end

      end

      class RestrictedDelivery < Browser::Modal
        def checkbox
          checkbox_field = browser.input :css => "input[id^=sdc-extraserviceswin-rdcheckbox-inputEl]"
          verify_field = browser.table :css => "table[id^=sdc-extraserviceswin-rdcheckbox]"
          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def price

        end
      end


      class NonDeliveryNotice < Browser::Modal
        def checkbox
          checkbox_field = browser.input :css => "input[id^=sdc-extraserviceswin-nndcheckbox-inputEl]"
          verify_field = browser.table :css => "table[id^=sdc-extraserviceswin-nndcheckbox]"
          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def price

        end
      end


      class Fragile < Browser::Modal
        def checkbox
          checkbox_field = browser.input :css => "input[id^=sdc-extraserviceswin-shcheckbox-inputEl]"
          verify_field = browser.table :css => "table[id^=sdc-extraserviceswin-shcheckbox]"
          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def price

        end
      end

      class MerchandiseReturnReceipt < Browser::Modal
        def checkbox
          checkbox_field = browser.input :css => "input[id^=sdc-extraserviceswin-rrmcheckbox-inputEl]"
          verify_field = browser.table :css => "table[id^=sdc-extraserviceswin-rrmcheckbox]"
          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def price

        end
      end

      class NonRectangular < Browser::Modal
        def checkbox
          checkbox_field = browser.input :css => "input[id^=sdc-extraservices-nreccheckbox]"
          verify_field = browser.table :css => "table[id^=sdc-extraserviceswin-notrectangularcheckbox]"
          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def price

        end
      end



    end
  end
end





