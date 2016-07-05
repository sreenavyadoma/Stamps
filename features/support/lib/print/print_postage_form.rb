# encoding: utf-8
module Stamps
  module Print
    module Postage
      class ShipTo < Browser::Modal

        class PostageCountry < Browser::Modal
          def drop_down
            BrowserElement.new (browser.divs :css => "div[class*=x-form-trigger]")[2]
          end

          def text_box
            BrowserTextBox.new (browser.text_field :name => "mailToCountry")
          end

          def select selection
            box = text_box
            button = drop_down
            selection_label = BrowserElement.new browser.div :text => selection
            5.times {
              begin
                break if box.text.include? selection
                break if box.text.include? selection
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

        def text_area
          BrowserTextBox.new (browser.text_field :id => "sdc-mainpanel-shiptotextarea-inputEl")
        end

        def country
          PostageCountry.new param
        end

        def email
          Email.new param
        end



        # Domestic Ship-To
        def set address
          text_area.safe_click
          text_area.set address
          text_area.safe_click
        end

        def name
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptonamefield-inputEl")
        end

        def company
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptocompanyfield-inputEl")
        end

        def address_1
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptoaddress1field-inputEl")
        end

        def address_2
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptoaddress2field-inputEl")
        end

        def city
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptocityfield-inputEl")
        end

        def province
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptoprovincefield-inputEl")
        end

        def postal_code
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptopostcodefield-inputEl")
        end

        def phone
          BrowserTextBox.new (browser.text_field :id => "sdc-intlform-shiptophonefield-inputEl")
        end

        def contacts
          Print::Postage::Contacts.new param
        end
      end

      class PrintOn < Browser::Modal

        def drop_down
          BrowserElement.new ((browser.divs (Print::Locators::FormBody.print_on_drop_down_divs))[0])
        end

        def text_box
          BrowserTextBox.new (browser.text_field Print::Locators::FormBody.print_on_text_field)
        end

        def select selection
          box = text_box
          button = drop_down
          selection_label = BrowserElement.new browser.div :text => selection
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
          drop_down = BrowserElement.new (browser.divs :css => "div[class*=x-form-trigger]")[0]
          selection_field = BrowserElement.new browser.div :text => selection

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

      class Weight < Browser::Modal
        class Pounds < Browser::Modal
          def text_box
            BrowserTextBox.new (browser.text_field :id => 'sdc-mainpanel-poundsnumberfield-inputEl'), "data-errorqtip"
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
            button = BrowserElement.new browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new browser.div :css => "table[id=sdc-mainpanel-poundsnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class Ounces < Browser::Modal
          def text_box
            BrowserTextBox.new (browser.text_field :id => 'sdc-mainpanel-ouncesnumberfield-inputEl'), "data-errorqtip"
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
            button = BrowserElement.new browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=up]"
            value.to_i.times do
              button.safe_click
            end
          end

          def decrement value
            button = BrowserElement.new browser.div :css => "table[id=sdc-mainpanel-ouncesnumberfield-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div[class*=down]"
            value.to_i.times do
              button.safe_click
            end
          end
        end

        class AutoWeigh < Browser::Modal
          def checkbox_element
            browser.input :id => "sdc-mainpanel-autoweightcheckbox-inputEl"
          end

          def checkbox

            checkbox_field = checkbox_element
            verify_field = browser.table :id => "sdc-mainpanel-autoweightcheckbox"

            Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"

          end
        end

        def weigh_button
          BrowserElement.new browser.span :id => "sdc-mainpanel-scalebtn-btnIconEl"
        end

        def auto_weigh
          AutoWeigh.new param
        end

        def lbs
          Pounds.new param
        end

        def oz
          Ounces.new param
        end
      end

      class Service < Browser::Modal

        def text_box
          BrowserTextBox.new browser.text_field :name => "servicePackage"
        end

        def drop_down
          BrowserElement.new (browser.divs :css => "div[class*=x-form-arrow-trigger]")[5]
        end

        def select selection
          logger.info "Select Service #{selection}"
          box = text_box
          button = drop_down
          if selection == "First-Class Mail Letter"
            selection_label = BrowserElement.new browser.tr :css => "tr[data-qtip*='First-Class Mail Envelope']"
          else
            selection_label = BrowserElement.new browser.tr :css => "tr[data-qtip*='#{selection}']"
          end
          10.times {
            begin
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              selected_service = box.text
              logger.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
              break if selected_service.include? selection
            rescue
              #ignore
            end
          }
          logger.info "#{selection} service selected."
          selection_label
        end

        def cost selection
          button = drop_down
          cost_label = BrowserElement.new browser.td :css => "tr[data-qtip*='#{selection}']>td:nth-child(3)"
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
          selection_label = BrowserElement.new browser.tr :css => "tr[data-qtip*='#{selection}']"
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
          BrowserElement.new browser.label :id => "sdc-mainpanel-servicepricelabel"
        end

      end

      class ShipFrom < Browser::Modal

        def drop_down
          BrowserElement.new (browser.div :css => "table[id=sdc-mainpanel-shipfromdroplist-triggerWrap]>tbody>tr>td[class*=trigger-cell]>div")
        end

        def manage_ship_from_address_field
          browser.div :text => 'Manage Shipping Addresses...'
        end

        def ship_from_selection selection
          browser.div :text => selection
        end

        def manage_shipping_address
          Print::Postage::ManageShippingAddresses.new(@browser)
        end

        def manage_shipping_addresses
          self.ship_from "Manage Shipping Addresses..."
        end

        def text_box
          BrowserTextBox.new browser.text_field :id => "sdc-mainpanel-shipfromdroplist-inputEl"
        end

        def select selection
          @manage_shipping_address = Print::Postage::ManageShippingAddresses.new param

          #return @manage_shipping_address if @manage_shipping_address.present?

          ship_from_dropdown = self.drop_down
          ship_from_textbox = self.text_box
          ship_from_dropdown.safe_click
          ship_from_default_selection_field = (browser.divs :css => "div[data-qtip*='Return To Address']")[0] #"div[id^=shipfromdroplist][id$=trigger-picker]"


          if selection.downcase == "default"
            ship_from_selection_field = ship_from_default_selection_field
          elsif selection.downcase.include? "manage shipping"
            ship_from_selection_field = browser.div :text => "Manage Shipping Addresses..."
          else
            ship_from_selection_field = browser.div :text => "#{selection}"
          end

          selection_label = BrowserElement.new ship_from_selection_field
          logger.info "Selection Text: #{selection_label.text}"

          if selection.downcase.include? "manage shipping"
            10.times{
              begin
                ship_from_dropdown.safe_click unless selection_label.present?
                selection_label.scroll_into_view
                selection_label.safe_click
                return @manage_shipping_address if @manage_shipping_address.present?
              rescue
                #ignore
              end

            }
          else
            10.times{
              ship_from_dropdown.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_text = selection_label.text
              selection_label.safe_click
              text_val = ship_from_textbox.text
              begin
                break if text_val.include? selection_text
              end unless selection_text.nil? || text_val.nil?
            }
          end
        end

      end

      class StampAmount < Browser::Modal
        def text_box
          BrowserTextBox.new (browser.text_field :name => "stampAmount"), "data-errorqtip"
        end

        def set value
          text_field = text_box
          text_field.set value
          logger.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button = BrowserElement.new browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new browser.div :css => "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class Email < Browser::Modal

        def checkbox_element
          browser.input :id => "sdc-mainpanel-emailcheckbox-inputEl"
        end

        def checkbox

          checkbox_field = checkbox_element
          verify_field = browser.table :id => "sdc-mainpanel-emailcheckbox"

          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"

        end

        def text_box
          BrowserTextBox.new (browser.text_field :id => "sdc-mainpanel-emailtextfield-inputEl")
        end

      end

      class Tracking < Browser::Modal

        def text_box
          BrowserTextBox.new browser.text_field :name => "tracking"
        end

        def drop_down
          BrowserElement.new (browser.divs :css => "div[class*=x-form-arrow-trigger]")[7]
        end

        def select selection
          logger.info "Select Tracking #{selection}"
          box = text_box
          button = drop_down
          selection_label = BrowserElement.new browser.div :text => selection
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
          BrowserElement.new browser.label :id => "sdc-mainpanel-trackingpricelabel"
        end
      end

      class InsureFor < Browser::Modal
        def checkbox

        end

        def text_box
          BrowserTextBox.new browser.text_field :id => "sdc-mainpanel-insureamtnumberfield-inputEl"
        end

        def increment value

        end

        def decrement value

        end

        def price
          BrowserElement.new browser.label :id => "sdc-mainpanel-insurancepricelabel"
        end
      end

      class ShipDate < Browser::Modal

        def text_box
          BrowserTextBox.new (browser.text_field :id => "sdc-mainpanel-shipdatedatefield-inputEl")
        end

        def date_picker

        end

      end

      class Contacts < Browser::Modal

        def link
          BrowserElement.new browser.a :css => "[class*=sdc-mainpanel-shiptolinkbtn]"
        end

        def open
          button = link
          contacts_modal = Print::Postage::ContactsModal.new param
          5.times do
            button.safe_click
            sleep 1
            return contacts_modal if contacts_modal.present?
          end
          stop_test "Unable to open Contacts Modal, check your code." unless contacts_modal.present?
        end
      end

      class CostCode  < Browser::Modal
        def text_box
          BrowserTextBox.new browser.text_field :name => "costCodeId"
        end

        def drop_down
          buttons = browser.divs :css => "div[class*=x-form-arrow-trigger]"
          button = BrowserElement.new (buttons.last)
        end

        def select selection
          logger.info "Select Cost Code #{selection}"

          box = text_box
          button = drop_down
          selection_label = BrowserElement.new browser.div :text => selection
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
          BrowserTextBox.new (browser.text_field :css => "input[class*='sdc-previewpanel-quantitynumberfield']")
        end

        def set value
          text_field = text_box
          text_field.set value
          logger.info "Quantity set to #{text_field.text}"
        end

        def increment value
          button = BrowserElement.new (browser.divs :css => "div[class*=x-form-spinner-up]")[7]
          value.to_i.times do
            button.safe_click
          end
        end

        def decrement value
          button = BrowserElement.new (browser.divs :css => "div[class*=x-form-spinner-down]")[7]
          value.to_i.times do
            button.safe_click
          end
        end
      end
    end
  end
end
