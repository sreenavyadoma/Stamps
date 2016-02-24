module Orders
  module Stores
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
      class ServiceMappingGrid < OrdersObject

        class ServiceMappingLineItem < OrdersObject

          class ServiceMappingShippingService < OrdersObject

            def initialize(browser, index)
              super browser
              @index = index
            end

            def select country
              log.info "Select Country #{country}"
              selection = StampsLabel.new (@browser.lis :text => country)[@index]
              text_box_field = (@browser.text_fields :name => "OriginCountryCode")[@index-1]
              text_box = StampsTextbox.new text_box_field
              drop_down = StampsButton.new text_box_field.parent.parent.divs[1]

              10.times {
                begin
                  drop_down.safe_click unless selection.present?
                  selection.scroll_into_view
                  selection.safe_click
                  log.info "Selection #{text_box.text} - #{(text_box.text.include? country)?"was selected": "not selected"}"
                  break if text_box.text.include? country
                rescue
                  #ignore
                end
              }
              log.info "#{country} selected."
            end
          end

          def initialize browser, number
            super browser
            @number = number
          end

          def present?
            delete.present?
          end

          def requested_services
            text_field = @browser.text_fields(css: "div[class*=requested-service]>div>div>div>input")[@number-1]
            StampsTextbox.new text_field
          end

          def delete
            StampsButton.new (@browser.spans :css => "span[class*=sdc-icon-remove]")[@number-1]
          end

          def shipping_Service
            ServiceMappingShippingService.new @browser
          end
        end

        def add_new_service_mapping_btn
          StampsButton.new @browser.span(text: "Add New Service Mapping")
        end

        def size
          (@browser.divs :css => "div[id^=singleservicemappingitem][class*=x-container-default]").size
        end

        def item number
          add_button = add_new_service_mapping_btn
          log.info "Item Count: #{size}"

          20.times{
            break if size >= number
            sleep 1
            break if size >= number
            add_button.safe_click if number > size
            log.info "Service Mapping Item Count: #{size}"
          }

          log.info "User Entered Number: #{number}. Actual Item Count: #{size}"

          ServiceMappingLineItem.new @browser, number
        end
      end

      def present?
        browser_helper.present? (@browser.div text: "Amazon Settings")
      end

      def wait_until_present
        browser_helper.wait_until_present (@browser.div text: "Amazon Settings")
      end

      def service_mapping_grid
        ServiceMappingGrid.new @browser
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
  end
end