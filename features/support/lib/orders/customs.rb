module Stamps
  module Orders
    class OriginCountry < Browser::Modal

      def initialize param, index
        super param
        @index = index
      end

      def text_box
        TextBoxElement.new ((browser.text_fields name: "OriginCountryCode")[@index-1])
      end

      def select country
        DropDownElement
        logger.info "Select Country #{country}"
        selection = ElementWrapper.new (browser.lis text: country)[@index]
        text_box = self.text_box
        drop_down = ElementWrapper.new text_box.element.parent.parent.divs[1]

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
        links = browser.links css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>a"
        ElementWrapper.new links.first
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
        ElementWrapper.new browser.span text: "Restrictions..."
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

      def add_button
        ElementWrapper.new (browser.spans text: "Add Item").last
      end

      def present?
        add_button.present?
      end

      def size
        (browser.tables css: "div[id^=associatedcustomsitems]>div[id^=singlecustomsitem]").size
      end

      def item number
        add = add_button
        logger.info "Item Count: #{size}"

        20.times{
          break if size >= number
          sleep 1
          break if size >= number
          add.safe_click if number > size
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
          TextBoxElement.new ((browser.text_fields css: "div[id*=customswindow] input[name=Quantity]")[@index-1]), "data-errorqtip"
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
          button = ElementWrapper.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = ElementWrapper.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
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
          TextBoxElement.new ((browser.text_fields name: "Value")[@index-1]), "data-errorqtip"
        end

        def set value
          text_box.set value
          logger.info "Ounces set to #{text_box.text}"
        end

        def increment value
          button = ElementWrapper.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=up]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = ElementWrapper.new (browser.divs css: "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")[@index-1]
          value.to_i.times do
            button.safe_click
          end
        end
      end

      attr_reader :delete, :description, :qty, :unit_price, :origin, :hs_tariff

      def initialize param, number
        super param
        @delete = ElementWrapper.new (browser.spans css: "div[id*=customswindow] span[class*=sdc-icon-remove]")[number-1]
        @description = TextBoxElement.new ((browser.text_fields css: "div[class*=customs-description] input[name=Description]")[number-1]), "data-errorqtip"
        @qty = Qty.new param, number
        @unit_price = UnitPrice.new param, number
        @origin = OriginCountry.new param, number
        @hs_tariff = TextBoxElement.new (browser.text_fields name: "TariffNo")[number-1]
      end

      def present?
        delete.present?
      end
    end

    class UspsPrivactActStatementModal < Browser::Modal
      attr_reader :window_title, :okay

      def initialize param
        super param
        @window_title ||= ElementWrapper.new browser.div text: "USPS Privacy Act Statement"
        @okay ||= browser.span text: "OK"
      end

      def present?
        window_title.present?
      end
    end

    class RestrictionsAndProhibitionsModal < Browser::Modal

      def present?

      end

    end

    class InternalTransaction < Browser::Modal

      def text_box
        TextBoxElement.new browser.text_field name: "IsITNRequired"
      end

      def select selection
        logger.info "Select Internal Transaction Number: #{selection}"
        text_box = self.text_box
        drop_down = ElementWrapper.new browser.div id: "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker"
        selection_label = ElementWrapper.new browser.li text: selection
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
        TextBoxElement.new browser.text_field name: "CustomsContents"
      end

      def select selection
        logger.info "Select Internal Transaction Number: #{selection}"
        text_box = self.text_box
        drop_down = ElementWrapper.new browser.div id: "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker"
        selection_label = ElementWrapper.new browser.li text: selection
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
        TextBoxElement.new browser.text_field name: "NonDelivery"
      end

      def select selection
        logger.info "Select Internal Transaction Number: #{selection}"
        text_box = self.text_box
        drop_down = ElementWrapper.new browser.div id: "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker"
        selection_label = ElementWrapper.new browser.li text: selection
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

      attr_reader :item_grid, :usps_privacy_act_warning, :close_button, :package_contents, :non_delivery_options, :internal_transaction,
                  :more_info, :itn_number, :license, :invoice, :total_value_element, :i_agree, :privacy_statement, :privacy_link,
                  :restrictions_link, :restrictions_prohibitions_link, :x_button

      def initialize param
        super param
        @item_grid ||= CustomsItemGrid.new param
        @package_contents ||= PackageContents.new param
        @non_delivery_options ||= NonDeliveryOptions.new param
        @internal_transaction ||= InternalTransaction.new param

        @more_info ||= TextBoxElement.new browser.text_field name: "CustomsComments"
        @usps_privacy_act_warning ||= ElementWrapper.new (browser.label text: "You must agree to the USPS Privacy Act Statement")
        @itn_number ||= TextBoxElement.new browser.text_field name: "AES"
        @license ||= TextBoxElement.new browser.text_field name: "CustomsLicenseNumber"
        @certificate ||= TextBoxElement.new browser.text_field name: "CustomsCertificateNumber"
        @invoice ||= TextBoxElement.new browser.text_field name: "CustomsInvoiceNumber"
        @total_value_element ||= ElementWrapper.new browser.div css: "div[id^=customswindow-][id$=-body]>div>div[id^=panel]>div>div>div>div[id^=displayfield]>div>div"

        field = browser.input css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div>div>div>input"
        verify_field = browser.div css: "div[id^=customswindow-][id$=-body]>div>div:nth-child(3)>div>div>div>div>div>div>div>div>div>div[id^=checkbox]"
        @i_agree ||= CheckboxElement.new field, verify_field, "class", "checked"

        @privacy_statement ||= UspsPrivactActStatementModal.new param
        @privacy_link ||= ElementWrapper.new browser.span text: "USPS Privacy Act Statement"
        @restrictions_link ||= RestrictionsAndProhibitionsModal.new param
        @restrictions_prohibitions_link ||= ElementWrapper.new browser.span text: "Restrictions and Prohibitions"

        @close_button ||= ElementWrapper.new browser.span text: "Close"
        @x_button ||= ElementWrapper.new browser.image css: "img[class*='x-tool-close']"
      end

      def present?
        item_grid.present?
      end

      def wait_until_present
        close_button.safely_wait_until_present 10
      end

      def total_value
        ParameterHelper.remove_dollar_sign total_value_element
      end

      def usps_privacy_act_statement
        5.times{
          privacy_link.safe_click
          return privacy_statement if privacy_statement.present?
        }
      end

      def restrictions_and_prohibitions
        5.times{
          restrictions_prohibitions_link.safe_click
          return restrictions_link if restrictions_link.present?
        }
      end

      def close
        close_button.click_while_present
      end

      def cancel
        x_button.click_while_present
      end
    end
  end
end