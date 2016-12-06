# encoding: utf-8
module Stamps
  module Mail
    class PostageCountry < Browser::Modal
      attr_reader :text_box, :drop_down

      def initialize param
        super param
        @text_box = TextboxElement.new browser.text_field name: "mailToCountry"
        @drop_down = ElementWrapper.new (browser.divs css: "div[class*=x-form-trigger]")[2]
      end

      def select selection
        selection_label = ElementWrapper.new browser.div text: selection
        5.times {
          begin
            break if text_box.text.include? selection
            break if text_box.text.include? selection
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if text_box.text.include? selection
          rescue
            #ignore
          end
        }
      end
    end

    class ShipTo < Browser::Modal
      attr_reader :text_area, :country, :email, :name, :company, :address_1, :address_2, :city, :province, :postal_code,
                  :phone, :contacts

      def initialize param
        super param
        @text_area = TextboxElement.new (browser.textarea id: "sdc-mainpanel-shiptotextarea-inputEl")
        @country ||= PostageCountry.new param
        @email ||= Email.new param
        @name = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptonamefield-inputEl")
        @company = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptocompanyfield-inputEl")
        @address_1 = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptoaddress1field-inputEl")
        @address_2 = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptoaddress2field-inputEl")
        @city = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptocityfield-inputEl")
        @province = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptoprovincefield-inputEl")
        @postal_code = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptopostcodefield-inputEl")
        @phone = TextboxElement.new (browser.text_field id: "sdc-intlform-shiptophonefield-inputEl")
        @contacts ||= Contacts.new param
      end

      # Domestic Ship-To
      def set address
        text_area.safe_click
        text_area.set address
        text_area.safe_click
      end
    end

    class PrintOn < Browser::Modal
      attr_reader :drop_down, :text_box

      def initialize param
        super param
        @drop_down = ElementWrapper.new browser.div(css: "table[id^=printmediadroplist-][id$=-triggerWrap]>tbody>tr>td>div[role=button]")
        @text_box = TextboxElement.new browser.text_field(css: "input[id^=printmediadroplist-][id$=-inputEl]")
      end

      def select selection
        @mail_services ||= data_for(:mail_services, {})
        selection_label = ElementWrapper.new browser.div(id: @mail_services[selection])
        25.times do
          begin
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click

            if selection.include? 'Stamps'
              break if text_box.text.include? 'Stamps'
            elsif selection.include? 'Paper'
              break if text_box.text.include? 'Paper'
            elsif selection.include? 'SDC-1200'
              break if text_box.text.include? 'SDC-1200'
            elsif selection.include? '5 x 8'
              break if text_box.text.include? 'Shipping Label - 5'
            elsif selection.include? 'Envelope 10'
              break if text_box.text.include? '#10'
            elsif selection.include? 'Envelope 9'
              break if text_box.text.include? '#9'
            elsif selection.include? 'Envelope A9'
              break if text_box.text.include? '#A9'
            elsif selection.include? 'Envelope 6'
              break if text_box.text.include? '#6'
            elsif selection.include? 'Envelope A2'
              break if text_box.text.include? '#A2'
            elsif selection.include? 'Envelope 7'
              break if text_box.text.include? '#7'
            elsif selection.include? 'Envelope 11'
              break if text_box.text.include? '#11'
            elsif selection.include? 'Envelope 12'
              break if text_box.text.include? '#12'
            elsif selection.include? 'SDC-3610'
              break if text_box.text.include? '3610'
            elsif selection.include? 'SDC-3710'
              break if text_box.text.include? '3710'
            elsif selection.include? 'SDC-3910'
              break if text_box.text.include? '3910'
            elsif selection.include? 'SDC-3810'
              break if text_box.text.include? '3810'
            elsif selection.include? 'Roll - 4 x 6'
              break if text_box.text.include? 'Roll - 4”'
            elsif selection.include? 'Roll - 4 1'
              break if text_box.text.include? 'Roll - 4 ⅛'
            end
          rescue
            #ignore
          end
        end
      end

      def tooltip selection
        selection_field = ElementWrapper.new browser.div(text: selection)
        10.times do
          drop_down.safe_click unless selection_field.present?
          return selection_field.attribute_value "data-qtip" if selection_field.present?
        end
      end
    end

    class Pounds < Browser::Modal
      def text_box
        TextboxElement.new (browser.text_field id: 'sdc-mainpanel-poundsnumberfield-inputEl'), "data-errorqtip"
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
        button = ElementWrapper.new browser.div css: "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = ElementWrapper.new browser.div css: "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class Ounces < Browser::Modal
      def text_box
        TextboxElement.new (browser.text_field id: 'sdc-mainpanel-ouncesnumberfield-inputEl'), "data-errorqtip"
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
        button = ElementWrapper.new browser.div css: "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = ElementWrapper.new browser.div css: "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class Weight < Browser::Modal
      attr_reader :auto_weigh, :weigh_button, :lbs, :oz

      def initialize param
        super param
        @auto_weigh ||= CheckboxElement.new browser.input(id: "sdc-mainpanel-autoweightcheckbox-inputEl"), browser.table(id: "sdc-mainpanel-autoweightcheckbox"), "class", "checked"
        @weigh_button = ElementWrapper.new browser.span id: "sdc-mainpanel-scalebtn-btnIconEl"
        @oz ||= Ounces.new param
        @lbs ||= Pounds.new param
      end
    end

    class MailServiceDropList < Browser::Modal
      attr_reader :text_box, :drop_down

      def initialize param
        super param
        @text_box = TextboxElement.new browser.text_field(name: "servicePackage")
        @drop_down = ElementWrapper.new browser.div(css: "table[id=sdc-mainpanel-servicedroplist-triggerWrap]>tbody>tr>td>div[role=button]")
      end

      def select selection
        logger.info "Select Service #{selection}"
        if selection == "First-Class Mail Letter"
          selection_label = ElementWrapper.new browser.tr(css: "tr[data-qtip*='First-Class Mail Envelope']")
        else
          selection_label = ElementWrapper.new browser.tr(css: "tr[data-qtip*='#{selection}']")
        end
        10.times {
          begin
            selected_service = text_box.safe_text
            break if selected_service.include? selection
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            logger.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
          rescue
            #ignore
          end
        }
        logger.info "#{selection} service selected."
        selection_label
      end

      def cost selection
        button = drop_down
        cost_label = ElementWrapper.new browser.td css: "tr[data-qtip*='#{selection}']>td:nth-child(3)"
        10.times {
          begin
            button.safe_click unless cost_label.present?
            if cost_label.present?
              service_cost = ParameterHelper.remove_dollar_sign cost_label.text
              logger.info "Service Cost for \"#{selection}\" is #{service_cost}"
              return service_cost
            end
          rescue
            #ignore
          end
        }
        blur_out
      end

      def tooltip selection
        button = drop_down
        selection_label = ElementWrapper.new browser.tr css: "tr[data-qtip*='#{selection}']"
        5.times {
          begin
            button.safe_click unless selection_label.present?
            if selection_label.present?
              tooltip = selection_label.attribute_value "data-qtip"
              logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
              return tooltip
            end
          rescue
            #ignore
          end
        }
        blur_out
      end

      def price
        ElementWrapper.new browser.label id: "sdc-mainpanel-servicepricelabel"
      end

    end

    class MailShipFrom < Browser::Modal

      def drop_down
        ElementWrapper.new (browser.div css: "table[id=sdc-mainpanel-shipfromdroplist-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div")
      end

      def manage_ship_from_address_field
        browser.div text: 'Manage Shipping Addresses...'
      end

      def ship_from_selection selection
        browser.div text: selection
      end

      def manage_shipping_address
        MailManageShippingAddresses.new param
      end

      def manage_shipping_addresses
        self.ship_from "Manage Shipping Addresses..."
      end

      def text_box
        TextboxElement.new browser.text_field id: "sdc-mainpanel-shipfromdroplist-inputEl"
      end

      def select selection
        @manage_shipping_address = MailManageShippingAddresses.new param

        #return @manage_shipping_address if @manage_shipping_address.present?

        drop_down.safe_click
        default_selection_field = (browser.divs css: "div[data-qtip*='Return To Address']")[0] #"div[id^=shipfromdroplist][id$=trigger-picker]"

        if selection.downcase == "default"
          ship_from_selection_field = default_selection_field
        elsif selection.downcase.include? "manage shipping"
          ship_from_selection_field = browser.div(text: "Manage Mailing Addresses...")
        else
          ship_from_selection_field = browser.div text: "#{selection}"
        end

        selection_label = ElementWrapper.new ship_from_selection_field
        #logger.info "Selection Text: #{selection_label.text}"

        if selection.downcase.include? "manage shipping"
          10.times{
            begin
              drop_down.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              return @manage_shipping_address if @manage_shipping_address.present?
            rescue
              #ignore
            end

          }
        else
          10.times{
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_text = selection_label.safe_text
            selection_label.safe_click
            text_val = text_box.text
            begin
              break if text_val.include? selection_text
            end unless selection_text.nil? || text_val.nil?
          }
        end
      end

    end

    class StampAmount < Browser::Modal
      def text_box
        TextboxElement.new (browser.text_field name: "stampAmount"), "data-errorqtip"
      end

      def set value
        text_field = text_box
        text_field.set value
        logger.info "Pounds set to #{text_field.text}"
      end

      def increment value
        button = ElementWrapper.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = ElementWrapper.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class Email < Browser::Modal
      attr_reader :checkbox, :text_box
      def initialize param
        super param
        @checkbox ||= CheckboxElement.new browser.input(id: "sdc-mainpanel-emailcheckbox-inputEl"), browser.table(id: "sdc-mainpanel-emailcheckbox"), "class", "checked"
        @text_box = TextboxElement.new browser.text_field(id: "sdc-mainpanel-emailtextfield-inputEl")
      end

      def set value
        checkbox.check
        text_box.set value
      end
    end

    class Tracking < Browser::Modal

      def text_box
        TextboxElement.new browser.text_field name: "tracking"
      end

      def drop_down
        ElementWrapper.new (browser.divs css: "div[class*=x-form-arrow-trigger]")[7]
      end

      def select selection
        logger.info "Select Tracking #{selection}"
        box = text_box
        button = drop_down
        selection_label = ElementWrapper.new browser.div text: selection
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_tracking = box.text
            logger.info "Selected Tracking #{selected_tracking} - #{(selected_tracking.include? selection)?"done": "tracking not selected"}"
            break if selected_tracking.include? selection
          rescue
            #ignore
          end
        }
        logger.info "Tracking selected: #{selection}"
        selection_label
      end

      def price
        ElementWrapper.new browser.label id: "sdc-mainpanel-trackingpricelabel"
      end
    end

    class InsureFor < Browser::Modal
      def checkbox

      end

      def text_box
        TextboxElement.new browser.text_field id: "sdc-mainpanel-insureamtnumberfield-inputEl"
      end

      def increment value

      end

      def decrement value

      end

      def price
        ElementWrapper.new browser.label id: "sdc-mainpanel-insurancepricelabel"
      end
    end

    class ShipDate < Browser::Modal

      def text_box
        TextboxElement.new (browser.text_field id: "sdc-mainpanel-shipdatedatefield-inputEl")
      end

      def date_picker

      end

    end

    class Contacts < Browser::Modal

      def link
        ElementWrapper.new browser.a css: "[class*=sdc-mainpanel-shiptolinkbtn]"
      end

      def open
        button = link
        contacts_modal = ContactsModal.new param
        5.times do
          button.safe_click
          sleep 1
          return contacts_modal if contacts_modal.present?
        end
        "Unable to open Contacts Modal, check your code.".should eql "" unless contacts_modal.present?
      end
    end

    class CostCode  < Browser::Modal
      def text_box
        TextboxElement.new browser.text_field name: "costCodeId"
      end

      def drop_down
        buttons = browser.divs css: "div[class*=x-form-arrow-trigger]"
        button = ElementWrapper.new (buttons.last)
      end

      def select selection
        logger.info "Select Cost Code #{selection}"

        box = text_box
        button = drop_down
        selection_label = ElementWrapper.new browser.div text: selection
        sleep 1
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_cost_code = box.text
            logger.info "Selected Cost Code #{selected_cost_code} - #{(selected_cost_code.include? selection)?"done": "cost code not selected"}"
            break if selected_cost_code.include? selection
          rescue
            #ignore
          end
        }
        logger.info "Origin Country selected: #{selection}"
        selection_label
      end

    end

    class Quantity < Browser::Modal
      def text_box
        TextboxElement.new (browser.text_field css: "input[class*='sdc-previewpanel-quantitynumberfield']")
      end

      def set value
        text_field = text_box
        text_field.set value
        logger.info "Quantity set to #{text_field.text}"
      end

      def increment value
        button = ElementWrapper.new (browser.divs css: "div[class*=x-form-spinner-up]")[7]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = ElementWrapper.new (browser.divs css: "div[class*=x-form-spinner-down]")[7]
        value.to_i.times do
          button.safe_click
        end
      end
    end
  end
end
