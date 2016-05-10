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
        5.times do
          break if button.present?
        end

        5.times do
          button.safe_click
          button.safe_click
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
        button = StampsButton.new (@browser.span text: "Save")
        server_error = Orders::Stores::ServerError.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        15.times do
          button.safe_click
          5.times do
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              log.info error_str
              server_error.ok
              stop_test "Server Error: \n#{error_msg}"
            end
            break unless present?
          end
          break unless present?
        end
      end

      def add_new_service_mapping
        @browser.span text: "Add New Service Mapping"
      end

      def store_nickname
        StampsTextbox.new ((@browser.text_fields css: "input[name^=textfield-][name$=-inputEl][maxlength='50']").last)
      end

      def automatically_import_new_orders
        label = (@browser.label text: "Automatically Import New Orders")
        checkbox_field = label.parent.input
        verify_field = label.parent.parent.parent
        StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end
    end

    class MarketPlace < OrdersObject

      def present?
        window_title.present?
      end

      def close
        button = StampsButton.new ((@browser.imgs :css => "img[class*='x-tool-close']").last)
        button.safe_click
        sleep 1
        15.times do
          button.safe_click
          break unless button.present?
        end
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
        stop_test "Volusion Store Modal did not open."
      end

      def rakuten_button
        StampsButton.new (@browser.imgs :css => "img[src*='rakuten']").last
      end

      def rakuten
        button = rakuten_button
        store = Rakuten.new @browser
        10.times do
          button.safe_click
          sleep 2
          return store if store.present?
        end
        stop_test "Rakuten Store Modal did not open."
      end

      def etsy_button
        StampsButton.new (@browser.imgs :css => "img[src*='etsy']").last
      end

      def etsy
        button = etsy_button
        store = Etsy.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
        stop_test "Etsy Store Modal did not open."
      end

      def shopify_button
        StampsButton.new (@browser.imgs :css => "img[src*='shopify']").last
      end

      def shopify
        button = shopify_button
        store = Shopify.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
        stop_test "Etsy Store Modal did not open."
      end

      def three_d_cart_button
        StampsButton.new (@browser.imgs :css => "img[src*='3dcart']").last
      end

      def three_d_cart
        button = three_d_cart_button
        store = ThreeDCart.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
        stop_test "3dcart Store Modal did not open."
      end

      def ebay_button
        StampsButton.new (@browser.imgs :css => "img[src*='ebay']").last
      end

      def ebay
        button = etsy_button
        store = Ebay.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
        stop_test "Etsy Store Modal did not open."
      end

      def yahoo_button
        StampsButton.new (@browser.imgs :css => "img[src*='yahoo']").last
      end

      def yahoo
        button = yahoo_button
        store = Yahoo.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
        stop_test "Yahoo Store Modal did not open."
      end

      def big_commerce_button
        StampsButton.new (@browser.imgs :css => "img[src*='bigcommerce']").last
      end

      def big_commerce
        button = big_commerce_button
        store = BigCommerce.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
        stop_test "Big Commerce Store Modal did not open."
      end

      def paypal_button
        StampsButton.new (@browser.imgs :css => "img[src*='paypal']").last
      end

      def paypal
        button = paypal_button
        store = PayPal.new @browser
        10.times do
          button.safe_click
          sleep 1
          return store if store.present?
        end
        stop_test "PayPal Store Modal did not open."
      end

    end

    class ManageStores < OrdersObject
      class ManageStoresGrid < OrdersObject

        def size
          (@browser.tables :css => "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table").size
        end

        def delete
          StampsButton.new (@browser.spans(text: "Delete").last)
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
          del_btn = delete
          delete_modal = DeleteStoreModal.new @browser
          stores_grid = @browser.divs(css: "div[class*='x-grid-item-container']").last
          tables = stores_grid.tables
          grid_size = tables.size
          log.info "Manage Stores:  Number of items in Grid #{grid_size}"

          if grid_size > 1
            0.upto grid_size do |index|
              row_to_delete = 0
              begin
                row = StampsLabel.new tables[row_to_delete]
                grid_item_name = browser_helper.text row
                log.info "#{index} Delete Item - #{grid_item_name}"

                if grid_item_name.include? "Manual Orders"
                  log.info "#{index} Skipping #{grid_item_name}"
                  row = StampsLabel.new tables[row_to_delete+1]
                  grid_item_name = browser_helper.text row
                  log.info "#{index} Delete Item - #{grid_item_name}"
                end

                3.times do
                  row.safe_click
                  row.safe_click
                  row.safe_click
                  row.safe_click
                  sleep 1
                  del_btn.safe_click
                  break unless delete_modal.present?
                  break unless delete_modal.present?
                  sleep 1
                  delete_modal.delete
                  break unless delete_modal.present?
                end
              rescue
                log.info "#{index} Skipping..."
              end

              stores_grid = @browser.divs(css: "div[class*='x-grid-item-container']").last
              tables = stores_grid.tables
              grid_size = tables.size
              log.info "Manage Stores: Number of items in Grid is #{grid_size}"
              break if grid_size == 1
            end
          end
        end

        def select store_name
          3.times do
            begin
              checkbox_field = @browser.divs(text: store_name).last
              sleep 1
              check_verify_field = checkbox_field.parent
              checkbox = StampsCheckbox.new checkbox_field, check_verify_field, "class", "focused"
              checkbox.check
              checkbox.check
              checkbox.check
              checkbox.check
              break if checkbox.checked?
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
        rakuten = RakutenSettings.new @browser
        amazon = AmazonSettings.new @browser
        volusion = VolusionSettings.new @browser
        etsy = EtsySettings.new @browser
        shopify = ShopifySettings.new @browser
        three_d_cart = ThreeDCartSettings.new @browser
        yahoo = YahooSettings.new @browser

        10.times do
          button.safe_click
          sleep 2
          return rakuten if rakuten.present?
          return amazon if amazon.present?
          return volusion if volusion.present?
          return etsy if etsy.present?
          return shopify if shopify.present?
          return three_d_cart if three_d_cart.present?
          return yahoo if yahoo.present?
        end
      end

      def reconnect
        button = StampsButton.new @browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(3)>span>span>span[id$=btnInnerEl]")
        stop_test "No Store selected from Manage Store grid or Reconnect button is not present.  Check your test" unless button.present?

        server_error = Orders::Stores::ServerError.new @browser

        amazon = ModifyAmazonStore.new @browser
        volusion = ModifyVolusionStore.new @browser
        rakuten = ModifyRakutenStore.new @browser
        etsy = ModifyEtsyStore.new @browser
        shopify = ModifyShopifyStore.new @browser
        three_d_cart = Modify3DCartStore.new @browser
        yahoo = ModifyYahooStore.new @browser

        15.times do
          button.safe_click
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          5.times do
            if server_error.present?
              error_str = server_error.message
              log.info error_str
              server_error.ok
              stop_test "Server Error: \n#{error_msg}"
            end
            return rakuten if rakuten.present?
            return volusion if volusion.present?
            return amazon if amazon.present?
            return etsy if etsy.present?
            return shopify if shopify.present?
            return three_d_cart if three_d_cart.present?
            return yahoo if yahoo.present?
          end
          return rakuten if rakuten.present?
          return volusion if volusion.present?
          return amazon if amazon.present?
          return etsy if etsy.present?
          return shopify if shopify.present?
          return three_d_cart if three_d_cart.present?
          return yahoo if yahoo.present?
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
