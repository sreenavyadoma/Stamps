module Orders
  module Stores

    class ImportingOrdersModal < OrdersObject
      def present?
        browser_helper.present? @browser.div(text: "Importing Orders")
      end

      def message
        browser_helper.text @browser.div(css: "div[id^=messagebox-][id$=-msg]")
      end

      def ok
        button = StampsButton.new @browser.span(text: "OK")
        20.times do
          button.safe_click
          break unless button.present?
        end
      end
    end

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
        20.times do
          sleep 1
          break if button.present?
        end

        raise "Delete Store Modal is not present." unless button.present?

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

    class StoreSettings < OrdersObject
      class ServiceMappingGrid < OrdersObject

        class ServiceMappingLineItem < OrdersObject

          class ServiceMappingShippingService < OrdersObject

            def initialize(browser, index)
              super browser
              @index = index
            end

            def drop_down
              StampsButton.new text_box_field.parent.parent.divs[1]
            end

            def text_box_field
              @browser.text_fields(name: "servicePackage")[@index]
            end

            def text_box
              StampsTextbox.new text_box_field
            end

            def select service
              log.info "Select Shipping Service #{service}"
              selection = StampsLabel.new (@browser.trs(css: "tr[data-qtip*='#{service}']")[@index])
              box = text_box
              dd = drop_down

              10.times {
                begin
                  dd.safe_click unless selection.present?
                  selection.scroll_into_view
                  selection.safe_click
                  log.info "Selection #{box.text} - #{(box.text.include? service)?"was selected": "not selected"}"
                  break if box.text.include? service
                rescue
                  #ignore
                end
              }
              log.info "#{service} selected."
            end
          end

          def initialize browser, index
            super browser
            @index = index
          end

          def present?
            delete.present?
          end

          def requested_services
            text_field = @browser.text_fields(name: "ServiceKey")[@index]
            StampsTextbox.new text_field
          end

          def delete
            StampsButton.new (@browser.spans :css => "span[class*=sdc-icon-remove]")[@index]
          end

          def shipping_Service
            ServiceMappingShippingService.new @browser, @index
          end
        end

        def add_new_service_mapping_btn
          StampsButton.new @browser.span(text: "Add New Service Mapping")
        end

        def size
          (@browser.divs :css => "div[id^=singleservicemappingitem][class*=x-container-default]").size
        end

        def item index
          index = index.to_i
          add_button = add_new_service_mapping_btn
          log.info "Item Count: #{size}"

          20.times{
            break if size >= index
            sleep 1
            break if size >= index
            add_button.safe_click if index > size
            log.info "Service Mapping Item Count: #{size}"
          }

          log.info "User Entered Number: #{index}. Actual Item Count: #{size}"

          ServiceMappingLineItem.new @browser, index-1
        end
      end

      def service_mapping
        ServiceMappingGrid.new @browser
      end

      def save
        sleep 2
        button = StampsButton.new (@browser.span text: "Save")
        server_error = Orders::ServerError.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        15.times do
          button.safe_click
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          sleep 2
          break unless present? && server_error.present?
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

    class MarketPlace < OrdersObject

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
        store = Amazon.new @browser
        10.times do
          button.safe_click
          sleep 2
          return store if store.present?
        end
      end

      def volusion_button
        StampsButton.new (@browser.imgs :css => "img[src*=volusion]").last
      end

      def volusion
        button = volusion_button
        store = Volusion.new @browser
        10.times do
          button.safe_click
          sleep 2
          return store if store.present?
        end
        raise "Volusion Store Modal did not open."
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
                    3.times do
                      checkbox.check
                      sleep 1
                      del_btn.safe_click
                      sleep 2
                      #delete_modal.wait_until_present
                      delete_modal.delete
                      delete_modal.delete
                      browser_helper.wait_while_present table
                      break unless delete_modal.present?
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
          3.times do
            begin
              sleep 1
              checkbox_field = @browser.divs(text: store_name).last
              sleep 1
              check_verify_field = checkbox_field.parent
              checkbox = StampsCheckbox.new checkbox_field, check_verify_field, "class", "focused"
              checkbox.check
              checkbox.check
              checkbox.check
              checkbox.check
            rescue
              #ignore
            end
          end
        end
      end

      def stores_grid
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
        StampsButton.new @browser.span(:css => "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(1)>span>span>span[id$=btnInnerEl]")
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
        MarketPlace.new @browser
      end

      def edit
        button = StampsButton.new @browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(2)>span>span>span[id$=btnInnerEl]")
        store_settings = StoreSettings.new @browser
        10.times do
          button.safe_click
          button.safe_click
          sleep 1
          store_settings.wait_until_present
          return store_settings if store_settings.present?
        end
      end

      def reconnect
        button = StampsButton.new @browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(3)>span>span>span[id$=btnInnerEl]")
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

      def delete_item
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
