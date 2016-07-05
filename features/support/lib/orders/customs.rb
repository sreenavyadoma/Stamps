module Stamps
  module Orders
    class OriginCountry < Browser::Modal

      def initialize param, index
        super param
        @index = index
      end

      def text_box
        BrowserTextBox.new ((browser.text_fields :name => "OriginCountryCode")[@index-1])
      end

      def select country
        logger.info "Select Country #{country}"
        selection = BrowserElement.new (browser.lis :text => country)[@index]
        text_box = self.text_box
        drop_down = BrowserElement.new text_box.element.parent.parent.divs[1]

        10.times {
          begin
            drop_down.safe_click unless selection.present?
            selection.scroll_into_view
            selection.safe_click
            logger.info "Selection #{text_box.text} - #{(text_box.text.include? country)?"was selected": "not selected"}"
            break if text_box.text.include? country
          rescue
            #ignore
          end
        }
        logger.info "#{country} selected."
      end
    end

    class CustomsFields < Browser::Modal

      def browser_edit_form_button
        links = browser.links :css => "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>a"
        BrowserElement.new links.first
      end

      def edit_form
        @customs_form = CustomsForm.new param
        edit_form_button = browser_edit_form_button
        20.times{
          edit_form_button.safe_click
          break if @customs_form.present?
        }

        begin
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          stop_test "Customs Information Modal is not visible."
        end unless @customs_form.present?
        @customs_form
      end

      def browser_restrictions_button
        BrowserElement.new browser.span :text => "Restrictions..."
      end

      def restrictions
        restrictions_button = browser_restrictions_button
        view_restrictions = Orders::Details::ViewRestrictions.new param
        5.times{
          restrictions_button.safe_click
          if view_restrictions.present?
            return view_restrictions
          end
        }
        nil
      end

    end

    class CustomsItemGrid < Browser::Modal

      def size
        (browser.tables :css => "div[id^=associatedcustomsitems]>div[id^=singlecustomsitem]").size
      end

      def item number
        add_button = BrowserElement.new (browser.spans :text => "Add Item").last
        logger.info "Item Count: #{size}"

        20.times{
          break if size >= number
          sleep 1
          break if size >= number
          add_button.safe_click if number > size
          logger.info "Item Count: #{size}"
        }

        logger.info "User Entered Number: #{number}. Actual Item Count: #{size}"

        CustomsLineItem.new param, number
      end
    end

    class CustomsLineItem < Browser::Modal

      class Qty < Browser::Modal
        def initialize param, number
          super param
          @index = number
        end

        def text_box
          BrowserTextBox.new ((browser.text_fields :css => "div[id*=customswindow] input[name=Quantity]")[@index-1]), "data-errorqtip"
        end

        def set value
          text_field = text_box
          value = value.to_i
          max = value + text_field.text.to_i
          max.times do
            current_value = text_field.text.to_i
            break if value == current_value
            if value > current_value
              increment 1
            else
              decrement 1
            end
            break if value == current_value
          end
          sleep 1
          logger.info "Qty set to #{text_field.text}"
        end

        def increment value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class UnitPrice < Browser::Modal
        def initialize param, number
          super param
          @index = number
        end

        def text_box
          BrowserTextBox.new ((browser.text_fields :name => "Value")[@index-1]), "data-errorqtip"
        end

        def set value
          text_box.set value
          logger.info "Ounces set to #{text_box.text}"
        end

        def increment value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class UnitWeightLbs < Browser::Modal
        def initialize param, number
          super param
          @index = number
        end

        def text_box
          BrowserTextBox.new ((browser.text_fields :name => "lbs")[@index-1]), "data-errorqtip"
        end

        def set value
          text_field = text_box
          value = value.to_i
          max = value + text_field.text.to_i
          max.times do
            current_value = text_field.text.to_i
            break if value == current_value
            if value > current_value
              increment 1
            else
              decrement 1
            end
            break if value == current_value
          end
          sleep 1
          logger.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class UnitWeightOz < Browser::Modal
        def initialize param, number
          super param
          @index = number
        end

        def text_box
          BrowserTextBox.new ((browser.text_fields :name => "oz")[@index-1]), "data-errorqtip"
        end

        def set value
          text_field = text_box
          value = value.to_i
          max = value + text_field.text.to_i
          max.times do
            current_value = text_field.text.to_i
            break if value == current_value
            if value > current_value
              increment 1
            else
              decrement 1
            end
            break if value == current_value
          end
          sleep 1
          logger.info "Ounces set to #{text_field.text}"
        end

        def increment value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      def initialize param, number
        super param
        @index = number
      end

      def present?
        delete.present?
      end

      def delete
        BrowserElement.new (browser.spans :css => "div[id*=customswindow] span[class*=sdc-icon-remove]")[@index-1]
      end

      def description
        BrowserTextBox.new ((browser.text_fields :css => "div[class*=customs-description] input[name=Description]")[@index-1]), "data-errorqtip"
      end

      def qty
        Qty.new param, @index
      end

      def unit_price
        UnitPrice.new param, @index
      end

      def lbs
        UnitWeightLbs.new param, @index
      end

      def oz
        UnitWeightOz.new param, @index
      end

      def origin
        OriginCountry.new param, @index
      end

      def hs_tariff
        BrowserTextBox.new (browser.text_fields :name => "TariffNo")[@index-1]
      end

    end

    class UspsPrivactActStatementModal < Browser::Modal
      def window_title
        BrowserElement.new browser.div :text => "USPS Privacy Act Statement"
      end

      def present?
        window_title.present?
      end

      def okay
        browser.span :text => "OK"
      end

    end

    class RestrictionsAndProhibitionsModal < Browser::Modal

      def present?

      end

    end

    class InternalTransaction < Browser::Modal

      def text_box
        BrowserTextBox.new browser.text_field :name => "IsITNRequired"
      end

      def select selection
        logger.info "Select Internal Transaction Number: #{selection}"
        text_box = self.text_box
        drop_down = BrowserElement.new browser.div :id => "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker"
        selection_label = BrowserElement.new browser.li :text => selection
        10.times {
          begin
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            logger.info "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
            break if text_box.text.include? selection
          rescue
            #ignore
          end
        }
        logger.info "#{selection} selected."
        selection_label
      end
    end

    class PackageContents < Browser::Modal

      def text_box
        BrowserTextBox.new browser.text_field :name => "CustomsContents"
      end

      def select selection
        logger.info "Select Internal Transaction Number: #{selection}"
        text_box = self.text_box
        drop_down = BrowserElement.new browser.div :id => "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker"
        selection_label = BrowserElement.new browser.li :text => selection
        10.times {
          begin
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            logger.info "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
            break if text_box.text.include? selection
          rescue
            #ignore
          end
        }
        logger.info "#{selection} selected."
        selection_label
      end
    end

    class NonDeliveryOptions < Browser::Modal

      def text_box
        BrowserTextBox.new browser.text_field :name => "NonDelivery"
      end

      def select selection
        logger.info "Select Internal Transaction Number: #{selection}"
        text_box = self.text_box
        drop_down = BrowserElement.new browser.div :id => "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker"
        selection_label = BrowserElement.new browser.li :text => selection
        10.times {
          begin
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            logger.info "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
            break if text_box.text.include? selection
          rescue
            #ignore
          end
        }
        logger.info "#{selection} selected."
        selection_label
      end
    end

    class CustomsForm < Browser::Modal

      def usps_privacy_act_warning
        BrowserElement.new (browser.label :text => "You must agree to the USPS Privacy Act Statement")
      end

      def present?
        BrowserElement.new browser.image :css => "img[class*='x-tool-close']"
      end

      def package_contents
        PackageContents.new param
      end

      def non_delivery_options
        NonDeliveryOptions.new param
      end


      def internal_transaction
        InternalTransaction.new param
      end

      def more_info
        BrowserTextBox.new browser.text_field :name => "CustomsComments"
      end

      def itn_number
        BrowserTextBox.new browser.text_field :name => "AES"
      end

      def license
        BrowserTextBox.new browser.text_field :name => "CustomsLicenseNumber"
      end

      def certificate
        BrowserTextBox.new browser.text_field :name => "CustomsCertificateNumber"
      end

      def invoice
        BrowserTextBox.new browser.text_field :name => "CustomsInvoiceNumber"
      end

      def item_grid
        sleep 1
        CustomsItemGrid.new param
      end

      def total_weight
        divs = browser.divs :css => "div[id^=displayfield]>div[id^=displayfield]>div[id^=displayfield]"
        div = divs[divs.size-2]
        weight_label = BrowserElement.new div
        logger.info "Total Weight: #{weight_label.text}"
        weight_label
      end

      def total_weight_lbs
        lbs = total_weight.text.scan(/\d+/).first
        logger.info "Pounds: #{lbs}"
        lbs
      end

      def total_weight_oz
        oz = total_weight.text.scan(/\d+/).last
        logger.info "Ounces: #{oz}"
        oz
      end

      def total_value
        ParameterHelper.remove_dollar_sign (BrowserElement.new (browser.divs :css => "div[class*=x-form-display-field-default]").last).text
      end

      def i_agree
        field = browser.input :css => "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div>div>div>input"
        verify_field = field.parent.parent.parent

        Stamps::Browser::BrowserCheckbox.new field, verify_field, "class", "checked"
      end

      def usps_privacy_act_statement
        privacy_statement = UspsPrivactActStatementModal.new param
        privacy_link = BrowserElement.new browser.span :text => "USPS Privacy Act Statement"
        5.times{
          privacy_link.safe_click
          return privacy_statement if privacy_statement.present?
        }
      end

      def restrictions_and_prohibitions
        restrictions_link = RestrictionsAndProhibitionsModal.new param
        restrictions_prohibitions_link = BrowserElement.new (browser.span :text => "Restrictions and Prohibitions")
        5.times{
          restrictions_prohibitions_link.safe_click
          return restrictions_link if restrictions_link.present?
        }
      end

      def close
        (BrowserElement.new browser.span :text => "Close").click_while_present
      end

      def cancel
        (BrowserElement.new browser.img :css => "img[class$=x-tool-close]").click_while_present
      end
    end

  end
#todo-rob refactor into Customs module
end