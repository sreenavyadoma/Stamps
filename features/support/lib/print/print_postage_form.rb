# encoding: utf-8
module Print
  module Postage
    class ShipTo < Print::Postage::PrintObject
      class ShipToDomestic < Print::Postage::PrintObject
        def country
          Country.new @browser
        end

        def text_area
          Textbox.new (@browser.text_field :id => "sdc-mainpanel-shiptotextarea-inputEl")
        end

        def set address
          text_area.safe_click
          text_area.set address
          text_area.safe_click
        end

      end

      class ShipToInternational < Print::Postage::PrintObject
        def country
          Country.new @browser
        end

        def name
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptonamefield-inputEl")
        end

        def company
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptocompanyfield-inputEl")
        end

        def address_1
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptoaddress1field-inputEl")
        end

        def address_2
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptoaddress2field-inputEl")
        end

        def city
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptocityfield-inputEl")
        end

        def province
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptoprovincefield-inputEl")
        end

        def postal_code
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptopostcodefield-inputEl")
        end

        def phone
          Textbox.new (@browser.text_field :id => "sdc-intlform-shiptophonefield-inputEl")
        end

      end

      def domestic
        ShipToDomestic.new @browser
      end

      def international
        ShipToInternational.new @browser
      end
    end

    class PrintOn < Print::Postage::PrintObject

      def drop_down
        Stamps::Browser::Button.new ((@browser.divs (Print::Locators::FormBody.print_on_drop_down_divs))[0])
      end

      def text_box
        Textbox.new (@browser.text_field Print::Locators::FormBody.print_on_text_field)
      end

      def select selection
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :text => selection
        5.times {
          begin
            button.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if box.text.include? selection
          rescue
            #ignore
          end
        }
      end

      def tooltip selection
        drop_down = Stamps::Browser::Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[0]
        selection_field = Label.new @browser.div :text => selection

        10.times {
          drop_down.safe_click unless selection_field.present?
          return selection_field.attribute_value "data-qtip" if selection_field.present?
        }
      end

      def enabled? selection

      end

      def disabled? selection

      end
    end

    class Weight < Print::Postage::PrintObject
      class Pounds < Print::Postage::PrintObject
        def text_box
          Textbox.new (@browser.text_field :id => 'sdc-mainpanel-poundsnumberfield-inputEl'), "data-errorqtip"
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
          log.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button = Stamps::Browser::Button.new @browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = Stamps::Browser::Button.new @browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class Ounces < Print::Postage::PrintObject
        def text_box
          Textbox.new (@browser.text_field :id => 'sdc-mainpanel-ouncesnumberfield-inputEl'), "data-errorqtip"
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
          log.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button = Stamps::Browser::Button.new @browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = Stamps::Browser::Button.new @browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
          value.to_i.times do
            button.safe_click
          end
        end
      end

      def lbs
        Pounds.new @browser
      end

      def oz
        Ounces.new @browser
      end
    end


    class Service < Print::Postage::PrintObject

      def text_box
        Textbox.new @browser.text_field :name => "servicePackage"
      end

      def drop_down
        Stamps::Browser::Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[5]
      end

      def select selection
        log.info "Select Service #{selection}"
        box = text_box
        button = drop_down
        if selection == "First-Class Mail Letter"
          selection_label = Label.new @browser.tr :css => "tr[data-qtip*='First-Class Mail Envelope']"
        else
          selection_label = Label.new @browser.tr :css => "tr[data-qtip*='#{selection}']"
        end
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            log.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        log.info "#{selection} service selected."
        selection_label
      end

      def cost selection
        button = drop_down
        cost_label = Label.new @browser.td :css => "tr[data-qtip*='#{selection}']>td:nth-child(3)"
        10.times {
          begin
            button.safe_click unless cost_label.present?
            if cost_label.present?
              service_cost = test_helper.remove_dollar_sign cost_label.text
              log.info "Service Cost for \"#{selection}\" is #{service_cost}"
              return service_cost
            end
          rescue
            #ignore
          end
        }
        click_form
      end

      def tooltip selection
        button = drop_down
        selection_label = Label.new @browser.tr :css => "tr[data-qtip*='#{selection}']"
        5.times {
          begin
            button.safe_click unless selection_label.present?
            if selection_label.present?
              tooltip = selection_label.attribute_value "data-qtip"
              log.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
              return tooltip
            end
          rescue
            #ignore
          end
        }
        click_form
      end

    end

    class ShipFrom < Print::Postage::PrintObject

      def drop_down
        Stamps::Browser::Button.new (@browser.div :css => "table[id=sdc-mainpanel-shipfromdroplist-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div")
      end

      def manage_ship_from_address_field
        @browser.div :text => 'Manage Shipping Addresses...'
      end

      def ship_from_selection selection
        @browser.div :text => selection
      end

      def manage_shipping_address
        Print::Postage::ManageShippingAddresses.new(@browser)
      end

      def manage_shipping_addresses
        self.ship_from "Manage Shipping Addresses..."
      end

      def text_box
        Textbox.new @browser.text_field :id => "sdc-mainpanel-shipfromdroplist-inputEl"
      end

      def select selection
        #@manage_shipping_address = Print::Postage::ManageShippingAddresses.new @browser

        #return @manage_shipping_address if @manage_shipping_address.present?

        ship_from_default_selection_field = (@browser.divs :css => "div[class*=x-boundlist-item]")[0] #"div[id^=shipfromdroplist][id$=trigger-picker]"
        ship_from_dropdown = self.drop_down
        ship_from_textbox = self.text_box

        if selection.downcase == "default"
          ship_from_selection_field = ship_from_default_selection_field
        elsif selection.downcase.include? "manage shipping"
          ship_from_selection_field = @browser.div :text => "Manage Shipping Addresses..."
        else
          ship_from_selection_field = @browser.div :text => "#{selection}"
        end

        selection_label = Label.new ship_from_selection_field

        if selection.downcase.include? "manage shipping"
          10.times{
            begin
              ship_from_dropdown.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              return @manage_shipping_adddress if @manage_shipping_adddress.present?
            rescue
              #ignore
            end
            click_form
          }
        else
          ship_from_dropdown.safe_click unless selection_label.present?
          if selection_label.present?
            selection_label.scroll_into_view
            selection_text = selection_label.text
          end
          10.times{
            ship_from_dropdown.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if ship_from_textbox.text.include? selection_label.text
          }
        end
      end

    end

    class StampAmount < Print::Postage::PrintObject
      def text_box
        Textbox.new (@browser.text_field :name => "stampAmount"), "data-errorqtip"
      end

      def set value
        text_field = text_box
        text_field.set value
        log.info "Pounds set to #{text_field.text}"
      end

      def increment value
        button = Stamps::Browser::Button.new @browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = Stamps::Browser::Button.new @browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
        value.to_i.times do
          button.safe_click
        end
      end
    end



    class Country < Print::Postage::PrintObject
      def drop_down
        Stamps::Browser::Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[2]
      end

      def text_box
        Textbox.new (@browser.text_field :name => "mailToCountry")
      end

      def select selection
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :text => selection
        5.times {
          begin
            button.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if box.text.include? selection
          rescue
            #ignore
          end
        }
      end
    end



    class Email < Print::Postage::PrintObject

      def checkbox select

        checkbox_field = @browser.input :id => "sdc-mainpanel-emailcheckbox-inputEl"
        verify_field = @browser.table :id => "sdc-mainpanel-emailcheckbox"
        checkbox = Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"

        if select
          checkbox.check
          log.info checkbox.checked?
        else
          checkbox.uncheck
          log.info checkbox.checked?
        end

      end

      def textbox
        Textbox.new (@browser.text_field :id => "sdc-mainpanel-emailtextfield-inputEl")
      end

    end


    class ShipDate < Print::Postage::PrintObject

      def text_box
        Textbox.new (@browser.text_field :id => "sdc-mainpanel-shipdatedatefield-inputEl")
      end

      def date_picker

      end

    end

    class Contacts < Print::Postage::PrintObject
      def open
        button = Stamps::Browser::Button.new @browser.a :css => "[class*=sdc-mainpanel-shiptolinkbtn]"
        contacts_modal = Print::Postage::ContactsModal.new @browser
        5.times do
          button.safe_click
          sleep 1
          return contacts_modal if contacts_modal.present?
        end
        raise "Unable to open Contacts Modal, check your code." unless contacts_modal.present?
      end
    end

    class CostCode  < Print::Postage::PrintObject
      def text_box
        Textbox.new @browser.text_field :name => "costCodeId"
      end

      def drop_down
        buttons = @browser.divs :css => "div[class*=x-form-arrow-trigger]"
        button = Stamps::Browser::Button.new (buttons.last)
      end

      def select selection
        log.info "Select Cost Code #{selection}"
        box = text_box
        button = drop_down
        selection_label = Label.new (@browser.divs :text => selection)[1]
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_cost_code = box.text
            log.info "Selected Cost Code #{selected_origin} - #{(selected_cost_code.include? selection)?"done": "cost code not selected"}"
            break if selected_cost_code.include? selection
          rescue
            #ignore
          end
        }
        log.info "Origin Country selected: #{selection}"
        selection_label
      end

    end

    class Quantity < Print::Postage::PrintObject
      def text_box
        Textbox.new (@browser.text_field :css => "input[class*=sdc-previewpanel-quantitynumberfield']")
      end

      def set value
        text_field = text_box
        text_field.set value
        log.info "Quantity set to #{text_field.text}"
      end

      def increment value
        button = Stamps::Browser::Button.new (@browser.divs :css => "div[class*=x-form-spinner-up]")[7]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = Stamps::Browser::Button.new (@browser.divs :css => "div[class*=x-form-spinner-down]")[7]
        value.to_i.times do
          button.safe_click
        end
      end

    end


  end
end
