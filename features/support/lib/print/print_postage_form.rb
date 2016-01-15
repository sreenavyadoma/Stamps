# encoding: utf-8
module Print
  module Postage
    class ShipTo < PrintObject
      class ShipToDomestic < PrintObject
        def country
          # cpy that country class here
        end

        def text_area
          #Textbox.new blah blah
        end
      end

      class ShipToInternational < PrintObject
        def country
          # cpy that country class here
        end

        def textbox1

        end

        def textbox2

        end

      end

      def domestic
        ShipToDomestic.new @browser
      end

      def international
        ShipToInternational @browser
      end
    end

    class PrintOn < PrintObject

      def drop_down
        Button.new (@browser.divs Print::Locators::FormBody.print_on_drop_down_divs)[0]
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
        drop_down = Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[0]
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

    class Weight < PrintObject
      class Pounds < PrintObject
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
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class Ounces < PrintObject
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
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = Button.new @browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
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

    class ExtraServices < PrintObject
      def button
        Button.new (@browser.span :id => "sdc-mainpanel-extraservicesbtn-btnIconEl")
      end

    end

    class Service < PrintObject
      def text_box
        Textbox.new @browser.text_field :name => "nsService"
      end

      def drop_down
        Button.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[6]
      end

      def select selection
        log.info "Select Service #{selection}"
        box = text_box
        button = drop_down
        selection_label = Label.new @browser.div :css => "div[data-qtip*='#{selection}']"
        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            if selected_service == "First Class (1 - 3 Days)"
              selected_service = "First Class Mail (1 - 3 Days)"
            end
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

    class ShipFrom < PrintObject

      def drop_down
        Button.new (@browser.divs :css => "table[id=sdc-mainpanel-shipfromdroplist-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div")
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
        @manage_shipping_adddress = Print::Postage::ManageShippingAddresses.new @browser

        return @manage_shipping_adddress if @manage_shipping_adddress.present?

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

    class StampAmount < PrintObject
      def text_box
        Textbox.new (@browser.text_field :name => "stampAmount"), "data-errorqtip"
      end

      def set value
        text_field = text_box
        text_field.set value
        log.info "Pounds set to #{text_field.text}"
      end

      def increment value
        button = Button.new @browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = Button.new @browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class Country < PrintObject
      def drop_down
        Button.new (@browser.divs :css => "div[class*=x-form-trigger]")[2]
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

    class ShipTo < PrintObject
      
    end
  end
end
