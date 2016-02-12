module Orders
  module Toolbar
    class AmazonStore < OrdersObject
      class OrderSource < OrdersObject
        def text_box
          Textbox.new (@browser.text_field :name => "AmazonMarketplace")
        end

        def drop_down
          Button.new (@browser.divs :css => "div[id^=combo-][id$=-triggerWrap][class$=x-form-trigger-wrap-default]>div[id^=combo-][id$=-trigger-picker]")[2]
        end

        def select selection
          dd = drop_down
          text_field = text_box
          selection_field = Label.new (@browser.li :text => selection)

          10.times do
            dd.safe_click unless selection_field.present?
            sleep 1
            selection_field.safe_click
            break if text_field.text.include? selection
          end

          log.info "Order Source #{selection} was #{(text_field.text.include? selection)?"Selected":"NOT selected"}"
        end

        def amazon
          select "Amazon.com"
        end

        def non_amazon
          select "Non-Amazon"
        end

      end

      class ProductIdentifier < OrdersObject
        def text_box
          Textbox.new (@browser.text_field :css => "div[id^=connectamazonwindow-][id$=-body][class$=resizable]>div>div>div>div>div>div>div>div>div>div:nth-child(9)>div>div>div>div>div>div>input")
        end

        def drop_down
          Button.new (@browser.divs :css => "div[id^=combo-][id$=-triggerWrap][class$=x-form-trigger-wrap-default]>div[id^=combo-][id$=-trigger-picker]")[3]
        end

        def select selection
          dd = drop_down
          text_field = text_box
          selection_field = Label.new (@browser.li :text => selection)

          10.times do
            dd.safe_click unless selection_field.present?
            sleep 1
            selection_field.safe_click
            break if text_field.text.include? selection
          end

          log.info "Product Identifier #{selection} was #{(text_field.text.include? selection)?"Selected":"NOT selected"}"
        end

        def use_sku
          select "Use SKU"
        end

        def use_asin
          select "Use the ASIN"
        end

      end

      def window_title
        Label.new(@browser.div :text => "Connect your Amazon Store")
      end

      def present?
        window_title.present?
      end

      def seller_id
        Textbox.new @browser.text_field(:name => "AmazonSellerID")
      end

      def auth_token
        Textbox.new @browser.text_field(:name => "AuthToken")
      end

      def verify_seller_id
        button = Button.new (@browser.span :text => "Verify Seller ID")
        3.times do
          button.safe_click
        end
      end

      def order_source
        OrderSource.new @browser
      end

      def product_identifier
        ProductIdentifier.new @browser
      end

      def connect
        button = (Button.new(@browser.span :text => "Connect"))
        5.times do
          button.safe_click
          break unless button.present?
        end
      end

    end

    class AddStoreOrMarketplace < OrdersObject

      def present?
        window_title.present?
      end

      def close
        button = Button.new (@browser.img :css => "img[class*='x-tool-img x-tool-close']")
        button.click_while_present
      end

      def wait_until_present
        window_title.wait_while_present
      end

      def window_title
        Label.new (@browser.divs :text => "Add your Store or Marketplace").first
      end

      def search_textbox
        Textbox.new (@browser.text_fields :css => "input[placeholder='Search by Name']").last
      end

      def search search_str
        search_textbox.set search_str
      end

      def amazon_button
        Button.new (@browser.imgs :css => "img[src*=amazon]").last
      end

      def amazon
        button = amazon_button
        store = AmazonStore.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
      end
    end

    class ManageStores < OrdersObject
      class ManageStoresGrid < OrdersObject
        class DeleteStoreModal < OrdersObject
          def present?
            browser_helper.present? (@browser.spans :text => "Delete").last
          end

          def delete
            button = Button.new (@browser.spans :text => "Delete").last
            button.click_while_present
          end

          def cancel
            Button.new (@browser.span :text => "Cancel")
          end
        end

        def size
          (@browser.tables :css => "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table").size
        end

        def delete
          Button.new (@browser.span :text => "Delete")
        end

        def delete_row row
          css = "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table:nth-child(#{row})>tbody>tr>td:nth-child(2)>div"
          grid_row_item = @browser.div :css => css
          grid_row_focused_field = Label.new grid_row_item.parent
          grid_row_field = Label.new grid_row_item

          del_btn = delete
          delete_modal = DeleteStoreModal.new @browser

          10.times do
            #select grid row item
            5.times do
              grid_row_field.safe_click
              break if (grid_row_focused_field.attribute_value "class").include? "focused"
            end
            del_btn.safe_click
            return delete_modal if delete_modal.present?
          end
        end
      end

      def grid
        ManageStoresGrid.new @browser
      end

      def close
        button = Button.new (@browser.imgs :css => "img[id^=tool][src*='R0lGODlhAQABAID']").first
        5.times do
          button.safe_click
          return unless button.present?
        end
      end

      def window_title
        Label.new(@browser.div :text => "Manage Stores")
      end

      def present?
        window_title.present?
      end

      def add_button
        Button.new (@browser.spans :css => "span[class*=sdc-icon-add]").last
      end

      def add
        button = add_button
        marketplace = store
        10.times do
          button.safe_click
          sleep 1
          return marketplace if marketplace.present?
        end
      end

      def store
        AddStoreOrMarketplace.new @browser
      end

      def edit

      end

      def reconnect

      end

      def delete

      end

      def manual_orders

      end
    end

    class GeneralSettings < OrdersObject

      class ResetFields < OrdersObject
        class Weight < OrdersObject
          class Pounds <  OrdersObject
            def text_box
              Textbox.new (@browser.text_field :name => 'sdc-resetfieldswin-poundsnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
=end
              text_field.set value
              log.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Ounces <  OrdersObject
            def text_box
              Textbox.new (@browser.text_field :name => 'sdc-resetfieldswin-ouncesnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
=end
              text_field.set value
              log.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          def enabled?
            browser_helper.enabled? (@browser.text_field :name => 'sdc-resetfieldswin-poundsnumberfield-inputEl')
          end

          def checkbox
            checkbox_field = @browser.input :id => "sdc-resetfieldswin-weightcheckbox-inputEl"
            verify_field = checkbox_field.parent.parent.parent
            attribute_name = "class"
            attribute_value = "checked"
            Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
          end

          def lbs
            Pounds.new @browser
          end

          def oz
            Ounces.new @browser
          end

        end

        class Dimensions < OrdersObject

          class Length <  OrdersObject
            def text_box
              Textbox.new (@browser.text_field :name => 'sdc-resetfieldswin-lengthnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
=end
              text_field.set value
              log.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Width <  OrdersObject
            def text_box
              Textbox.new (@browser.text_field :name => 'sdc-resetfieldswin-widthnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
=end
              text_field.set value
              log.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Height <  OrdersObject
            def text_box
              Textbox.new (@browser.text_field :name => 'sdc-resetfieldswin-heightnumberfield-inputEl')
            end

            def set value
              text_field = text_box
=begin
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
=end
              text_field.set value
              log.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = Button.new (@browser.div :css => "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          def enabled?
            browser_helper.enabled? (@browser.text_field :name => 'sdc-resetfieldswin-lengthnumberfield-inputEl')
          end

          def checkbox
            checkbox_field = @browser.input :id => "sdc-resetfieldswin-dimensionscheckbox-inputEl"
            verify_field = checkbox_field.parent.parent.parent
            attribute_name = "class"
            attribute_value = "checked"
            Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
          end

          def length
            Length.new @browser
          end

          def width
            Width.new @browser
          end

          def height
            Height.new @browser
          end

        end

        def present?
          browser_helper.present? (@browser.div :text => "Reset Fields")
        end

        def service
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-servicecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def weight
          Weight.new @browser
        end

        def dimensions
          Dimensions.new @browser
        end

        def ship_to_address
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-shiptoaddresscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def tracking
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-trackingcheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def extra_services
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-extraservicescheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def insurance
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-insurancecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def reference_numbers
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-referencenumberscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def cost_code
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-costcodecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def customs
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-customscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def quantity
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-quantitycheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def stamps_amount
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-stampsamountcheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def auto_advance_label_position
          parent = (@browser.label :text=> "Auto-Advance Label Position (NetStamps and Label Sheets)").parent
          checkbox_field = parent.input
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def close
          button = Button.new (@browser.span :text => "Close")
          5.times do
            return unless button.present?
            button.safe_click
            sleep 1
            return unless present?
          end
        end
      end

      class LogoffDropDown < OrdersObject
        def text_box
          Textbox.new (@browser.text_fields :css => "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[0]
        end

        def select selection
          drop_down = Button.new @browser.div :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(3)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = Label.new @browser.li :text => selection
          10.times do
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_field.text.include? selection
          end
        end

        def five_min
          select "5 min."
        end

        def ten_min
          select "10 min."
        end

        def fifteen_min
          select "15 min."
        end

        def thirty_min
          select "30 min."
        end

        def one_hour
          select "1 hour"
        end

        def two_hours
          select "2 hours"
        end
      end

      class PostDateDropDown < OrdersObject
        def text_box
          Textbox.new (@browser.text_fields :css => "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[1]
        end

        def select selection
          drop_down = Button.new @browser.div :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = Label.new @browser.li :text => selection
          10.times do
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_field.text.include? selection
          end
        end

        def twelve_am
          select "12:00 a.m."
        end

        def one_am
          select "1:00 a.m."
        end

        def two_am
          select "2:00 a.m."
        end

        def three_am
          select "3:00 a.m."
        end

        def four_am
          select "4:00 a.m."
        end

        def five_am
          select "5:00 a.m."
        end

        def six_am
          select "6:00 a.m."
        end

        def seven_am
          select "7:00 a.m."
        end

        def eight_am
          select "8:00 a.m."
        end

        def nine_am
          select "9:00 a.m."
        end

        def ten_am
          select "10:00 a.m."
        end

        def eleven_am
          select "11:00 a.m."
        end

        def twelve_pm
          select "12:00 p.m."
        end

        def one_pm
          select "1:00 p.m."
        end

        def two_pm
          select "2:00 p.m."
        end

        def three_pm
          select "3:00 p.m."
        end

        def four_pm
          select "4:00 p.m."
        end

        def five_pm
          select "5:00 p.m."
        end

        def six_pm
          select "6:00 p.m."
        end

        def seven_pm
          select "7:00 p.m."
        end

        def eight_pm
          select "8:00 p.m."
        end

        def nine_pm
          select "9:00 p.m."
        end

        def ten_pm
          select "10:00 p.m."
        end

        def eleven_pm
          select "11:00 p.m."
        end
      end

      class PostageBalanceDropDown < OrdersObject
        def text_box
          Textbox.new (@browser.text_fields :css => "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[2]
        end

        def select selection
          drop_down = Button.new @browser.div :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = Label.new @browser.li :text => selection
          10.times do
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_field.text.include? selection
          end
        end

        def zero
          select "$0"
        end

        def ten
          select "$10"
        end

        def twenty_five
          select "$25"
        end

        def fifty
          select "$50"
        end

        def one_hundred
          select "$100"
        end

        def two_hundred_fifty
          select "$250"
        end

        def five_hundred
          select "$500"
        end
      end

      def title
        Label.new @browser.div :text => "Settings"
      end

      def present?
        title.present?
      end

      def services
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(2)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def log_off
        LogoffDropDown.new @browser
      end

      def post_date
        PostDateDropDown.new @browser
      end

      def postage_balance
        PostageBalanceDropDown.new @browser
      end

      def print_confirm
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(6)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def reset_fields
        modal = ResetFields.new @browser
        button = Button.new @browser.span :text => "Select..."
        10.times do
          button.safe_click unless modal.present?
          return modal if modal.present?
        end
      end

      def usps_terms
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(8)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def contacts
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(10)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def shipments
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(15)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        Checkbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def save
        button = Button.new (@browser.span :text => "Save")
        10.times do
          button.safe_click
          return unless button.present?
        end
      end

      def close
        button = Button.new (@browser.img :css => "img[class$=close]")
        10.times do
          button.safe_click
          return unless button.present?
        end
      end
    end

    class Toolbar < OrdersObject
      class SettingsMenu < Print::Postage::PrintObject
        def button
          Button.new @browser.span :css => "span[class*=sdc-icon-settings]"
        end

        def select menu_item
          dd = button
          case menu_item.downcase
            when /settings/
              selection = Label.new(@browser.span :text => "General Settings")
              modal = GeneralSettings.new @browser
            when /stores/
              selection = Label.new(@browser.span :text => "Add/Edit Stores")
              modal = ManageStores.new @browser
            else
              raise "Invalid Menu Selection - #{menu_item} is not recognized.  Valid selections are Settings or Stores."
          end

          20.times do
            return modal if modal.present?
            dd.safe_click unless selection.present?
            selection.safe_click
          end
          raise "Unable to Toolbar Settings Menu Selection - #{menu_item}"
        end

        def general_settings
          select "Settings"
        end

        def manage_stores
          select "Stores"
        end
      end

      class MoveMenu < OrdersObject
        class MoveConfirmation < OrdersObject
          def present?
            browser_helper.present? @browser.span Orders::Locators::ToolBar::confirmation_modal_move_label
          end

          def move_label
            Label.new @browser.span Orders::Locators::ToolBar::confirmation_modal_move_label
          end

          def cancel_label
            Label.new @browser.span Orders::Locators::ToolBar::confirmation_modal_cancel_label
          end

          def move
            label = move_label
            label.click_while_present
            Orders::FilterPanel.new @browser
          end

          def cancel
            label = cancel_label
            label.click_while_present
            Orders::FilterPanel.new @browser
          end
        end

        def drop_down
          Button.new @browser.span Orders::Locators::ToolBar::move
        end

        def select selection
          case selection
            when :shipped
              selection_str = "Move to Shipped"
            when :cancelled
              selection_str = "Move to Canceled"
            when :awaiting_shipment
              selection_str = "Move to Awaiting Shipment"
            else
              raise "#{selection} is not a valid value for Move Menu.  Valid values are :shipped, :canceled or :awaiting_shipment"
          end

          confirmation = MoveConfirmation.new @browser
          dd = drop_down
          selection_label = Label.new @browser.span :text => selection_str

          10.times{
            dd.safe_click unless selection_label.present?
            selection_label.safe_click
            return confirmation if confirmation.present?
          }

          raise "Unable to select #{selection} from Move menu."
        end

        def to_shipped
          select :shipped
        end

        def to_canceled
          select :cancelled
        end

        def to_awaiting_shipment
          select :awaiting_shipment
        end

      end

      def settings
        SettingsMenu.new @browser
      end

      def reprint
        button = Button.new @browser.span(text: "Reprint")
        modal = RePrintModal.new @browser
        label_unavailable = LabelUnavailable.new @browser
        15.times do
          return modal if modal.present?
          return label_unavailable if label_unavailable.present?
          button.safe_click
        end
      end

      def print
        open_window Orders::PrintModal.new @browser
      end

      def print_invalid_address
        open_window InvalidAddressError.new(@browser)
      end

      def print_expecting_error *args
        error_window = OrderErrors.new(@browser)
        open_window error_window
        case args.length
          when 0
            error_window
          when 1
            error_window.error_message.include? error_message
          else
            raise "Illegal number of arguments."
        end
      end

      def open_window window
        return window if window.present?
        print = Button.new ((@browser.spans :css => "div[id^=toolbar-][id$=-targetEl]>a>span>span>span")[1])

        print.click

        usps_terms = USPSTermsModal.new @browser

        if usps_terms.is_usps_terms_modal_present
          usps_terms.check_dont_show_again_checkbox
          usps_terms.click_i_agree_button
        end

        #order_grid = Orders::Grid::OrdersGrid.new @browser
        #checked_rows_cache = order_grid.checkbox.checked_rows

        naws_plugin_error = NawsPluginError.new @browser
        error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
        install_plugin_error = ErrorInstallPlugin.new @browser

        20.times do
          if install_plugin_error.present?
            install_plugin_error.close
            return nil
          end

          begin
            if error_connecting_to_plugin.present?
              5.times{
                error_connecting_to_plugin.ok
                #order_grid.checkbox.check_all checked_rows_cache
                break unless error_connecting_to_plugin.present?
              }
            end

            if naws_plugin_error.present?
              5.times{
                naws_plugin_error.ok
                #order_grid.checkbox.check_all checked_rows_cache
                break unless naws_plugin_error.present?
              }
            end

            return window if window.present?
            #order_grid.checkbox.check_all checked_rows_cache
            print.click
          rescue
            #ignore
          end
        end

        return window if window.present?
        raise "Unable to open Print Window.  There might be errors in printing of order is not ready for printing.  Check your test."
      end

      def add
        order_details = Orders::Details::OrderDetails.new @browser
        grid = Orders::Grid::OrdersGrid.new @browser
        add_button = Button.new @browser.span Orders::Locators::ToolBar::add

        # Initializing Order Database
        initializing_db = Label.new @browser.div :text => "Initializing Order Database"
        nav_bar = Orders::Navigation::NavigationBar.new @browser

        sleep 2
        grid.checkbox.uncheck 1

        old_id = grid.order_id.row 1
        log.info "Row 1 Order ID #{old_id}"
        20.times do |count|
          begin
            add_button.safe_click
            sleep 3
            log.info initializing_db.text if initializing_db.present?
            if order_details.present?
              new_id = grid.order_id.row 1
              log.info "Add #{(order_details.present?)?"successful!":"failed!"}  -  Old Grid 1 ID: #{old_id}, New Grid 1 ID: #{new_id}"
              return order_details
            end
            sleep 2
          rescue
            #ignore
          end
        end

        if initializing_db.present?
          message = "\n*****  #{initializing_db.text}  *****\nUser #{nav_bar.username.text} is NOT setup correctly in ShipStation.  Check that this user's email is unique."
          log.info message
          raise message
        end

        raise "Unable to Add New Orders!" unless order_details.present?
      end

      def move
        MoveMenu.new @browser
      end

      def browser_settings_button
        Button.new (@browser.span :css => "span[class*=sdc-icon-settings]")
      end

      def usps_intl_terms
        USPSTermsModal.new @browser
      end

      def wait_until_present
        browser_helper.wait_until_present @browser.span Orders::Locators::ToolBar::add
      end

      def present?
        browser_helper.present? @browser.span Orders::Locators::ToolBar::add
      end

      def settings_modal
        SettingsModal.new(@browser)
      end

      def page_count
        divs = @browser.divs :css => "div[id^=tbtext]"
        div = divs.last
        present = browser_helper.present? div
        log.info "Page count: #{browser_helper.text div}"
        div
      end

      def page_number
        field = @browser.text_field :css => "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
        text_box = Textbox.new field
        text_box
      end

      def first_page
        field = @browser.span :css => "span[class*=x-tbar-page-first]"
        label = Label.new field
        label
      end

      def first_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = Label.new field
        label.disabled?
      end

      def previous_page
        Label.new field @browser.span :css => "span[class*=x-tbar-page-prev]"
      end

      def previous_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = Label.new field
        label.disabled?
      end

      def next_page
        Label.new field @browser.span :css => "span[class*=x-tbar-page-next]"
      end

      def last_page
        Label.new field @browser.span :css => "span[class*=x-tbar-page-last]"
      end

      def last_page_disabled
        Label.new @browser.a :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      end

      def total_number_of_pages
        label = (Label.new @browser.divs :css => "div[id^=tbtext-]").last
        number_str=label.text
        number = number_str.scan /\d+/
        number.last.to_s
      end

      def per_page_dd
        #browser, drop_down_button, selection_field_type, drop_down_input
        buttons = @browser.divs :css => "div[id^=combo-][id$=trigger-picker]"
        drop_down_button = buttons.first
        drop_down_input = @browser.text_field :css => "input[name^=combo]"
        Dropdown.new @browser, drop_down_button, :li, drop_down_input
      end
    end
  end
end