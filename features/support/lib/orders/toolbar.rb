module Orders
  module Toolbar

    class DeleteStoreModal < OrdersObject
      def present?
        browser_helper.present? delete_btn
      end

      def wait_until_present
        browser_helper.wait_until_present delete_btn
      end

      def delete_btn
        spans = @browser.spans(:css => "div[componentid^=dialoguemodal]>div[id^=panel]>div>div>div>a:nth-child(1)>span>span>span[id$=btnInnerEl]")
        first = spans.first
        last = spans.last
        (browser_helper.present? last)?last:first
      end

      def delete
        button = StampsButton.new delete_btn
        button.wait_until_present
        10.times do
          button.safe_click
          button.safe_click
          sleep 1
          break unless present?
        end
      end

      def cancel
        StampsButton.new (@browser.span :text => "Cancel")
      end
    end

    class AmazonStoreSettings < OrdersObject

      def present?
        browser_helper.present? (@browser.div text: "Amazon Settings")
      end

      def wait_until_present
        browser_helper.wait_until_present (@browser.div text: "Amazon Settings")
      end

      def save
        sleep 2
        button = StampsButton.new (@browser.span text: "Save")
        10.times do
          button.safe_click
          sleep 1
          break unless present?
        end
      end

      def add_new_service_mapping
        @browser.span text: "Add New Service Mapping"
      end

      def store_nickname
        StampsTextbox.new (@browser.text_field css: "input[name^=textfield-][name$=-inputEl][maxlength='50']")
      end

      def automatically_import_new_orders
        label = (@browser.label text: "Automatically Import New Orders")
        checkbox_field = label.parent.span
        verify_field = label.parent.parent.parent
        StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end
    end

    class AmazonStore < OrdersObject
      class OrderSource < OrdersObject
        def text_box
          StampsTextbox.new (@browser.text_field :name => "AmazonMarketplace")
        end

        def drop_down
          StampsButton.new (@browser.divs :css => "div[id^=combo-][id$=-triggerWrap][class$=x-form-trigger-wrap-default]>div[id^=combo-][id$=-trigger-picker]")[2]
        end

        def select selection
          dd = drop_down
          text_field = text_box
          selection_field = StampsLabel.new (@browser.li :text => selection)

          10.times do
            dd.safe_click unless selection_field.present?
            sleep 1
            selection_field.safe_click
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
          StampsTextbox.new (@browser.text_field :css => "div[id^=connectamazonwindow-][id$=-body][class$=resizable]>div>div>div>div>div>div>div>div>div>div:nth-child(9)>div>div>div>div>div>div>input")
        end

        def drop_down
          StampsButton.new (@browser.b text: "Product Identifier").parent.parent.div.div.div.divs[1]
        end

        def select selection
          dd = drop_down
          text_field = text_box
          selection_field = StampsLabel.new (@browser.li :text => selection)

          10.times do
            dd.safe_click unless selection_field.present?
            sleep 1
            selection_field.safe_click
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

      class ServerError < OrdersObject
        def present?
          window_title = @browser.divs(text: "Server Error").last
          #log.info "Server Error" if browser_helper.present? window_title
          browser_helper.present? window_title
        end

        def message
          log.info "Server Error"
          browser_helper.text @browser.divs(css: "div[id^=dialoguemodal-][id$=-body][class*=sdc-warning]>div>div").last
        end

        def ok
          20.times do
            button = @browser.spans(text: "OK").last
            browser_helper.safe_click button
            browser_helper.safe_click button
            sleep 1
            break unless present?
          end
        end

      end

      def window_title
        StampsLabel.new(@browser.div :text => "Connect your Amazon Store")
      end

      def present?
        browser_helper.present? @browser.span(:text => "Verify Seller ID")
      end

      def seller_id
        StampsTextbox.new @browser.text_field(:name => "AmazonSellerID")
      end

      def auth_token
        StampsTextbox.new @browser.text_field(:name => "AuthToken")
      end

      def verify_seller_id
        button = StampsButton.new (@browser.span :text => "Verify Seller ID")
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
        button = (StampsButton.new(@browser.span :text => "Connect"))
        server_error = ServerError.new @browser
        10.times do
          button.safe_click
          button.safe_click
          sleep 1
          button.safe_click
          button.safe_click
          sleep 1
          button.safe_click
          button.safe_click
          break unless present?
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
        end
        raise server_error.message if server_error.present?
      end

      def connect_expecting_store_settings
        settings = AmazonStoreSettings.new @browser
        button = (StampsButton.new(@browser.span :text => "Connect"))
        5.times do
          button.safe_click
          button.safe_click
          button.safe_click
          settings.wait_until_present
          return settings if settings.present?
          return settings if settings.present?
        end
      end
    end

    class ModifyAmazonStore < AmazonStore

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your Amazon Store Connection")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class AddStoreOrMarketplace < OrdersObject

      def present?
        window_title.present?
      end

      def close
        button = StampsButton.new (@browser.img :css => "img[class*='x-tool-img x-tool-close']")
        button.click_while_present
      end

      def wait_until_present
        window_title.wait_while_present
      end

      def window_title
        StampsLabel.new (@browser.divs :text => "Add your Store or Marketplace").first
      end

      def search_textbox
        StampsTextbox.new (@browser.text_fields :css => "input[placeholder='Search by Name']").last
      end

      def search search_str
        search_textbox.set search_str
      end

      def amazon_button
        StampsButton.new (@browser.imgs :css => "img[src*=amazon]").last
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

        def size
          (@browser.tables :css => "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table").size
        end

        def delete
          StampsButton.new @browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(4)>span>span>span[id$=btnInnerEl]")
        end

        def delete_name name
          @browser.div text: "My Amazon Store"
        end

        def delete_row row
          css = "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table:nth-child(#{row})>tbody>tr>td:nth-child(2)>div"
          grid_row_item = @browser.div :css => css
          grid_row_focused_field = StampsLabel.new grid_row_item.parent
          grid_row_field = StampsLabel.new grid_row_item

          del_btn = self.delete
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

        def delete_all
          del_btn = self.delete
          delete_modal = DeleteStoreModal.new @browser
          stores_grid = @browser.divs(css: "div[class*='x-grid-item-container']").last
          tables = stores_grid.tables
          grid_size = tables.size
          log.info "Manage Stores:  Number of items in Grid #{grid_size}"

          if grid_size > 1
            0.upto grid_size do
              tables.each_with_index do |table, index|
                begin
                  div = table.tbody.tr.tds[1].div
                  grid_item_name = browser_helper.text div
                  log.info "#{index} Delete Item - #{grid_item_name}"
                  if grid_item_name.include? "Manual Orders"
                    log.info "#{index} Skipping #{grid_item_name}"
                  else
                    checkbox = StampsCheckbox.new div, table, "class", "selected"
                    5.times do
                      checkbox.check
                      sleep 1
                      del_btn.safe_click
                      sleep 1
                      delete_modal.wait_until_present
                      delete_modal.delete
                      break unless delete_modal.present?
                      delete_modal.delete
                      break unless delete_modal.present?
                      sleep 1
                      browser_helper.wait_while_present table
                      break unless delete_modal.present?
                    end
                    log.info "#{index} Delete #{(checkbox.present?)?"Failed":"Successful"}"
                  end
                rescue
                  log.info "#{index} Skipping..."
                end

                stores_grid = @browser.divs(css: "div[class*='x-grid-item-container']").last
                tables = stores_grid.tables
                grid_size = tables.size
                log.info "Manage Stores: Number of items in Grid is #{grid_size}"
              end

            end
          end
        end

        def select store_name
          checkbox_field = @browser.divs(text: store_name).last
          browser_helper.wait_until_present checkbox_field
          check_verify_field = checkbox_field.parent
          checkbox = StampsCheckbox.new checkbox_field, check_verify_field, "class", "focused"
          checkbox.check
        end
      end

      def grid
        ManageStoresGrid.new @browser
      end

      def close
        button = StampsButton.new @browser.img(:css => "div[id^=managestoreswindow-][id$=header-targetEl]>div>img")
        5.times do
          button.safe_click
          return unless button.present?
        end
      end

      def window_title
        StampsLabel.new(@browser.div :text => "Manage Stores")
      end

      def present?
        window_title.present?
      end

      def add_button
        StampsButton.new (@browser.spans :css => "span[class*=sdc-icon-add]").last
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
        button = StampsButton.new @browser.span(text: "Edit")
        store_settings = AmazonStoreSettings.new @browser
        10.times do
          button.safe_click
          button.safe_click
          sleep 1
          store_settings.wait_until_present
          return store_settings if store_settings.present?
        end
      end

      def reconnect
        button = StampsButton.new @browser.span(text: "Reconnect")
        raise "No Store selected from Manage Store grid or Reconnect button is not present.  Check your test" unless button.present?
        reconnect_modal = ModifyAmazonStore.new @browser
        10.times do
          button.safe_click
          button.safe_click
          button.safe_click
          reconnect_modal.wait_until_present
          return reconnect_modal if reconnect_modal.present?
        end
      end

      def delete
        button = StampsButton.new @browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(4)>span>span>span[id$=btnInnerEl]")
        delete_modal = DeleteStoreModal.new @browser
        10.times do
          button.safe_click
          return delete_modal if delete_modal.present?
          button.safe_click
          return delete_modal if delete_modal.present?
          button.safe_click
          return delete_modal if delete_modal.present?
          button.safe_click
          sleep 1
          return delete_modal if delete_modal.present?
        end
      end

      def manual_orders

      end
    end

    class GeneralSettings < OrdersObject

      class ResetFields < OrdersObject
        class Weight < OrdersObject
          class Pounds <  OrdersObject
            def text_box
              StampsTextbox.new (@browser.text_field :name => 'sdc-resetfieldswin-poundsnumberfield-inputEl')
            end

            def set value
              text_field = text_box
              text_field.set value
              log.info "Pounds set to #{text_field.text}"
            end

            def increment value
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-poundsnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Ounces <  OrdersObject
            def text_box
              StampsTextbox.new (@browser.text_field :name => 'sdc-resetfieldswin-ouncesnumberfield-inputEl')
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
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-ouncesnumberfield-trigger-spinner>div[class*=down]")
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
            StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
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
              StampsTextbox.new (@browser.text_field :name => 'sdc-resetfieldswin-lengthnumberfield-inputEl')
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
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-lengthnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Width <  OrdersObject
            def text_box
              StampsTextbox.new (@browser.text_field :name => 'sdc-resetfieldswin-widthnumberfield-inputEl')
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
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-widthnumberfield-trigger-spinner>div[class*=down]")
              value.to_i.times do
                button.safe_click
              end
            end
          end

          class Height <  OrdersObject
            def text_box
              StampsTextbox.new (@browser.text_field :name => 'sdc-resetfieldswin-heightnumberfield-inputEl')
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
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=up]")
              value.to_i.times do
                button.safe_click
              end
            end

            def decrement value
              button = StampsButton.new (@browser.div :css => "div#sdc-resetfieldswin-heightnumberfield-trigger-spinner>div[class*=down]")
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
            StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
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
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
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
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def tracking
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-trackingcheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def extra_services
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-extraservicescheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def insurance
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-insurancecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def reference_numbers
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-referencenumberscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def cost_code
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-costcodecheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def customs
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-customscheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def quantity
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-quantitycheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def stamps_amount
          checkbox_field = @browser.input :id => "sdc-resetfieldswin-stampsamountcheckbox-inputEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def auto_advance_label_position
          parent = (@browser.label :text=> "Auto-Advance Label Position (NetStamps and Label Sheets)").parent
          checkbox_field = parent.input
          verify_field = checkbox_field.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def close
          button = StampsButton.new (@browser.span :text => "Close")
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
          StampsTextbox.new (@browser.text_fields :css => "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[0]
        end

        def select selection
          drop_down = StampsButton.new @browser.div :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(3)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = StampsLabel.new @browser.li :text => selection
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
          StampsTextbox.new (@browser.text_fields :css => "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[1]
        end

        def select selection
          drop_down = StampsButton.new @browser.div :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = StampsLabel.new @browser.li :text => selection
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
          StampsTextbox.new (@browser.text_fields :css => "input[id^=combo-][id$=-inputEl][name^=combo-][name$=-inputEl]")[2]
        end

        def select selection
          drop_down = StampsButton.new @browser.div :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div[id$=picker]"
          text_field = text_box
          selection_label = StampsLabel.new @browser.li :text => selection
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
        StampsLabel.new @browser.div :text => "Settings"
      end

      def present?
        title.present?
      end

      def services
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(2)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
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
        StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def reset_fields
        modal = ResetFields.new @browser
        button = StampsButton.new @browser.span :text => "Select..."
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
        StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def contacts
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(10)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def shipments
        checkbox_field = @browser.input :css => "div[id^=userprefswindow-][id$=-body]>div>div>div>div>div>div>div>div:nth-child(15)>div>div>div>div>div>div>div>input"
        verify_field = checkbox_field.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def save
        button = StampsButton.new (@browser.span :text => "Save")
        10.times do
          button.safe_click
          return unless button.present?
        end
      end

      def close
        button = StampsButton.new (@browser.img :css => "img[class$=close]")
        10.times do
          button.safe_click
          return unless button.present?
        end
      end
    end

    class Toolbar < OrdersObject
      class SettingsMenu < Print::Postage::PrintObject
        def button
          StampsButton.new @browser.span :css => "span[class*=sdc-icon-settings]"
        end

        def select menu_item
          dd = button
          case menu_item.downcase
            when /settings/
              selection = StampsLabel.new(@browser.span :text => "General Settings")
              modal = GeneralSettings.new @browser
            when /stores/
              selection = StampsLabel.new(@browser.span :text => "Add/Edit Stores")
              modal = ManageStores.new @browser
            else
              raise "Invalid Menu Selection - #{menu_item} is not recognized.  Valid selections are Settings or Stores."
          end

          20.times do
            sleep 1
            return modal if modal.present?
            dd.safe_click unless selection.present?
            #sleep 1
            selection.safe_click
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
            StampsLabel.new @browser.span Orders::Locators::ToolBar::confirmation_modal_move_label
          end

          def cancel_label
            StampsLabel.new @browser.span Orders::Locators::ToolBar::confirmation_modal_cancel_label
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
          StampsButton.new @browser.span Orders::Locators::ToolBar::move
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
          selection_label = StampsLabel.new @browser.span :text => selection_str

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

      class PerPage < OrdersObject

        def text_box
          StampsTextbox.new @browser.text_field(id: "sdc-batch-grid-pagingtoolbar-combobox-inputEl")
        end

        def select selection
          dd = StampsButton.new @browser.div(id: "sdc-batch-grid-pagingtoolbar-combobox-trigger-picker")
          per_page = StampsLabel.new @browser.li(text: selection)
          box = text_box
          10.times do
            dd.safe_click unless per_page.present?
            per_page.safe_click if per_page.present?
            return box.text if box.text.include? selection
          end
        end

        def x100
          select "100"
        end

        def x250
          select "250"
        end

        def x500
          select "500"
        end
      end

      def per_page
        PerPage.new @browser
      end

      def settings
        SettingsMenu.new @browser
      end

      def reprint
        button = StampsButton.new @browser.span(text: "Reprint")
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
        print = StampsButton.new ((@browser.spans :css => "div[id^=toolbar-][id$=-targetEl]>a>span>span>span")[1])

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
        raise "Unable to open Print Window.  There might be errors in printing OR order is not ready for printing.  Check your test."
      end

      def add
        order_details = Orders::Details::OrderDetails.new @browser
        grid = Orders::Grid::OrdersGrid.new @browser
        add_button = StampsButton.new @browser.span Orders::Locators::ToolBar::add

        # Initializing Order Database
        initializing_db = StampsLabel.new @browser.div :text => "Initializing Order Database"
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
        StampsButton.new (@browser.span :css => "span[class*=sdc-icon-settings]")
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
        text_box = StampsTextbox.new field
        text_box
      end

      def first_page
        field = @browser.span :css => "span[class*=x-tbar-page-first]"
        label = StampsLabel.new field
        label
      end

      def first_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = StampsLabel.new field
        label.disabled?
      end

      def previous_page
        StampsLabel.new field @browser.span :css => "span[class*=x-tbar-page-prev]"
      end

      def previous_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = StampsLabel.new field
        label.disabled?
      end

      def next_page
        StampsLabel.new field @browser.span :css => "span[class*=x-tbar-page-next]"
      end

      def last_page
        StampsLabel.new field @browser.span :css => "span[class*=x-tbar-page-last]"
      end

      def last_page_disabled
        StampsLabel.new @browser.a :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      end

      def total_number_of_pages
        label = (StampsLabel.new @browser.divs :css => "div[id^=tbtext-]").last
        number_str=label.text
        number = number_str.scan /\d+/
        number.last.to_s
      end
    end
  end
end