module Stamps
  module Orders
    module Stores
      class ImportingOrdersModal < Browser::Base

        def present?
          browser.div(text: "Importing Orders").present?
        end

        def message
          StampsField.new(browser.div(css: "div[id^=messagebox-][id$=-msg]")).text
        end

        def ok
          button = StampsField.new(browser.span(text: "OK"))
          20.times do
            button.click
            break unless button.present?
          end
        end
      end

      class DeleteStoreModal < Browser::Base
        def present?
          delete_btn.present?
        end

        def wait_until_present
          delete_btn.wait_until_present 7
        end

        def delete_btn
          spans = browser.spans(css: "div[componentid^=dialoguemodal]>div[id^=panel]>div>div>div>a:nth-child(1)>span>span>span[id$=btnInnerEl]")
          first = spans.first
          last = spans.last
          last.present? ? last : first
        end

        def delete
          button = StampsField.new delete_btn
          5.times do
            break if button.present?
          end

          5.times do
            button.click
            button.click
            break unless present?
          end
        end

        def cancel
          StampsField.new(browser.span text: "Cancel")
        end
      end


=begin
      class StoreSettings < Browser::Base
        class ServiceMappingGrid < Browser::Base
          class ServiceMappingLineItem < Browser::Base
            class ServiceMappingShippingService < Browser::Base

              def initialize(param, index)
                super(param)
                @index=index
              end

              def dropdown
                StampsField.new textbox_field.parent.parent.divs[1]
              end

              def textbox_field
                browser.text_fields(name: "servicePackage")[@index]
              end

              def textbox
                StampsTextbox.new textbox_field
              end

              def select service
                logger.info "Select Shipping service #{service}"
                selection=StampsField.new(browser.trs(css: "tr[data-qtip*='#{service}']")[@index])
                box=textbox
                dd=dropdown

                10.times {
                  begin
                    dd.click unless selection.present?
                    selection.scroll_into_view
                    selection.click
                    logger.info "Selection #{box.text} - #{(box.text.include? service)?"was selected": "not selected"}"
                    break if box.text.include? service
                  rescue
                    # ignore
                  end
                }
                logger.info "#{service} selected."
              end
            end

            def initialize(param, index)
              super(param)
              @index=index
            end

            def present?
              delete.present?
            end

            def requested_services
              text_field=browser.text_fields(name: "ServiceKey")[@index]
              StampsTextbox.new text_field
            end

            def delete
              StampsField.new(browser.spans(css: "span[class*=sdc-icon-remove]")[@index])
              end

            def shipping_Service
              ServiceMappingShippingService.new(param, @index)
            end
          end

          def add_new_service_mapping_btn
            StampsField.new browser.span(text: "Add New service Mapping")
          end

          def size
            (browser.divs css: "div[id^=singleservicemappingitem][class*=x-container-default]").size
          end

          def item index
            index=index.to_i
            add_button=add_new_service_mapping_btn
            logger.info "Item Count: #{size}"

            20.times{
              break if size >= index
              sleep(0.35)
              break if size >= index
              add_button.click if index > size
              logger.info "Service Mapping Item Count: #{size}"
            }

            logger.info "User Entered Number: #{index}. Actual Item Count: #{size}"

            ServiceMappingLineItem.new(param, index-1)
          end
        end

        def service_mapping
          ServiceMappingGrid.new(param)
        end

        def save
          button=StampsField.new(browser.span text: "Save")
          server_error=Orders::Stores::ServerError.new(param)
          importing_order=Orders::Stores::ImportingOrdersModal.new(param)

          15.times do
            button.click
            5.times do
              if importing_order.present?
                logger.info importing_order.message
                importing_order.ok
              end
              if server_error.present?
                error_str=server_error.message
                logger.info error_str
                server_error.ok
                expect("Server Error: \n#{error_str}").to eql ""
              end
              break unless present?
            end
            break unless present?
          end
        end

        def add_new_service_mapping
          browser.span text: "Add New service Mapping"
        end

        def store_nickname
          StampsTextbox.new((browser.text_fields css: "input[name^=textfield-][name$=-inputEl][maxlength='50']").last)
        end

        def automatically_import_new_orders
          label=(browser.label text: "Automatically Import New Orders")
          checkbox_field=label.parent.textbox
          verify_field=label.parent.parent.parent
          StampsCheckbox.new(checkbox_field, verify_field, "class", "checked")
        end
      end
=end

      module MarketPlaceWindowTitle
        def window_title
          cache[:window_title].nil? || !cache[:window_title].present? ? cache[:window_title] = StampsField.new(browser.div(css: "[id^=storeselectionwindow-] [class$=x-title-item]")) : cache[:window_title]
        end

        def x_btn
          cache[:x_btn].nil? || !cache[:x_btn].present? ? cache[:x_btn] = StampsField.new(browser.divs(css: "[id^=storeselectionwindow-] img").last) : cache[:x_btn]
        end
      end

      class MarketplaceDataView < Browser::Base

        def store_count
          begin
            return browser.divs(css: "[id^=dataview][class*=x-window-item]>[class=x-dataview-item][role=option]").size
          rescue
            # ignore
          end
          0
        end

        def store_field(str)
          case(str.downcase.to_sym)
            when :paypal
              cache[:paypal_store_field].nil? || !cache[:paypal_store_field].present? ? cache[:paypal_store_field] = StampsField.new(browser.a(css: "[data-store-name=paypal]")) : cache[:paypal_store_field]
            when :ebay
              cache[:ebay_store_field].nil? || !cache[:ebay_store_field].present? ? cache[:ebay_store_field] = StampsField.new(browser.a(css: "[data-store-name=paypal]")) : cache[:ebay_store_field]
            when :rakuten
              cache[:rakuten_store_field].nil? || !cache[:rakuten_store_field].present? ? cache[:rakuten_store_field] = StampsField.new(browser.a(css: "[data-store-name=paypal]")) : cache[:rakuten_store_field]
            when :shopify
              cache[:shopify_store_field].nil? || !cache[:shopify_store_field].present? ? cache[:shopify_store_field] = StampsField.new(browser.a(css: "[data-store-name=paypal]")) : cache[:shopify_store_field]
            when :amazon
              cache[:amazon_store_field].nil? || !cache[:amazon_store_field].present? ? cache[:amazon_store_field] = StampsField.new(browser.a(css: "[data-store-name=paypal]")) : cache[:amazon_store_field]
            when :etsy
              cache[:etsy_store_field].nil? || !cache[:etsy_store_field].present? ? cache[:etsy_store_field] = StampsField.new(browser.a(css: "[data-store-name=paypal]")) : cache[:etsy_store_field]
            when :magento
              cache[:magento_store_field].nil? || !cache[:magento_store_field].present? ? cache[:magento_store_field] = StampsField.new(browser.a(css: "[data-store-name=paypal]")) : cache[:magento_store_field]
            when :opencart
              cache[:opencart_store_field].nil? || !cache[:opencart_store_field].present? ? cache[:opencart_store_field] = StampsField.new(browser.div(css: "div[style*='/OpenCart']")) : cache[:opencart_store_field]
            when :square
              cache[:square_store_field].nil? || !cache[:square_store_field].present? ? cache[:square_store_field] = StampsField.new(browser.div(css: "div[style*='/squarebanner']")) : cache[:square_store_field]
            else
              return nil
          end
        end

        def store_window(str)
          case(str.downcase.to_sym)
            when :paypal
              if cache[:paypal_window].nil? || !cache[:paypal_window].present?
                cache[:paypal_window] = Browser::Base.new(param).extend(Stamps::Orders::Stores::PayPal::WindowTitle)
              end
              return cache[:paypal_window]
            when :ebay
              raise "#{str} not implemented."
            when :shopify
              raise "#{str} not implemented."
            when :amazon
              raise "#{str} not implemented."
            when :etsy
              raise "#{str} not implemented."
            when :magento
              raise "#{str} not implemented."
            when :square
              cache[:square_window].nil? || !cache[:square_window].present? ? cache[:square_window] = Browser::Base.new(param).extend(Orders::Stores::Square::WindowTitle) : cache[:square_window]
            when :opencart
              cache[:opencart_window].nil? || !cache[:opencart_window].present? ? cache[:opencart_window] = Browser::Base.new(param).extend(Orders::Stores::OpenCart::ShipStationUpgradeMessage) : cache[:opencart_window]
            else
              raise ArgumentError,  "#{str} - Invalid store selection or store is not yet implemented. Check your test."
          end
        end

        def add_store(str)
          20.times do
            return store_window(str).window_title.text if store_window(str).window_title.present?
            store_field(str).click
          end
          raise "Unable to add store #{str}"
        end

        def add_advanced_feature(str)
          20.times do
            store_field(str).click
            return store_window(str).window_title.text if store_window(str).window_title.present?
          end
          raise "Unable to click on store #{str}"
        end

        def requires_upgrade_msg(str)
          store_window(str).free_upgrade_message.present?
        end

        def available_shipstation_msg(str)
          store_window(str).available_in_shipstation_msg.present?
        end
      end

      class Marketplace < Browser::Base
        include MarketPlaceWindowTitle

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def contains(store_name)
          browser.imgs(class: "data-view-selection-enabled").each { |image| return store_name if image.attribute_value("src").include?(store_name.downcase) }
          nil
        end

        def close
          StampsField.new((browser.imgs css: "img[class*='x-tool-close']").last).click_while_present
        end

        def search_by_name
          if cache[:search_by_name].nil? || !cache[:search_by_name].present?
            cache[:search_by_name] = StampsTextbox.new(browser.text_field(css: "input[placeholder='Search by Name']"))
          end
          cache[:search_by_name]
        end

        def dataview
          cache[:dataview] = MarketplaceDataView.new(param) if cache[:dataview].nil? || !cache[:dataview].present?
          cache[:dataview]
        end
      end
=begin
      #todo-rob deprecated
      class ManageStores < Browser::StampsModal
        class ManageStoresGrid < Browser::StampsModal

          def size
            (browser.tables css: "div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table").size
          end

          def delete
            StampsField.new(browser.spans(text: "Delete").last)
          end

          def delete_name name
            browser.div text: "My Amazon Store"
          end

          def delete_row row
            css="div[id^=grid]>div[class^=x-grid-view]>div[class=x-grid-item-container]>table:nth-child(#{row})>tbody>tr>td:nth-child(2)>div"
            grid_row_item=browser.div css: css
            grid_row_focused_field=StampsField.new grid_row_item.parent
            grid_row_field=StampsField.new grid_row_item

            del_btn=self.delete
            delete_modal=DeleteStoreModal.new(param)

            10.times do
              #select grid row item
              5.times do
                grid_row_field.click
                break if (grid_row_focused_field.attribute_value "class").include? "focused"
              end
              del_btn.click
              return delete_modal if delete_modal.present?
            end
          end

          def delete_all
            del_btn=delete
            delete_modal=DeleteStoreModal.new(param)
            stores_grid=browser.divs(css: "div[class*='x-grid-item-container']").last
            tables=stores_grid.tables
            grid_size=tables.size
            logger.info "Manage Stores:  Number of items in Grid #{grid_size}"

            if grid_size > 1
              0.upto grid_size do |index|
                row_to_delete=0
                begin
                  row=StampsField.new tables[row_to_delete]
                  grid_item_name=StampsField.new(row).text
                  logger.info "#{index} Delete Item - #{grid_item_name}"

                  if grid_item_name.include? "Manual Orders"
                    logger.info "#{index} Skipping #{grid_item_name}"
                    row=StampsField.new tables[row_to_delete+1]
                    grid_item_name=StampsField.new(row).text
                    logger.info "#{index} Delete Item - #{grid_item_name}"
                  end

                  3.times do
                    row.click
                    row.click
                    row.click
                    row.click
                    sleep(0.35)
                    del_btn.click
                    break unless delete_modal.present?
                    break unless delete_modal.present?
                    sleep(0.35)
                    delete_modal.delete
                    break unless delete_modal.present?
                  end
                rescue
                  logger.info "#{index} Skipping..."
                end

                stores_grid=browser.divs(css: "div[class*='x-grid-item-container']").last
                tables=stores_grid.tables
                grid_size=tables.size
                logger.info "Manage Stores: Number of items in Grid is #{grid_size}"
                break if grid_size==1
              end
            end
          end

          def select store_name
            3.times do
              begin
                checkbox_field=browser.divs(text: store_name).last
                sleep(0.35)
                check_verify_field=checkbox_field.parent
                checkbox=StampsCheckbox.new checkbox_field, check_verify_field, "class", "focused"
                checkbox.check
                checkbox.check
                checkbox.check
                checkbox.check
                break if checkbox.checked?
              rescue
                # ignore
              end
            end
          end
        end

        def stores_grid
          ManageStoresGrid.new(param)
        end

        def close
          button=StampsField.new browser.img(css: "div[id^=managestoreswindow-][id$=header-targetEl]>div>img")
          5.times do
            button.click
            return unless button.present?
          end
        end

        def window_title
          StampsField.new(browser.div text: "Manage Stores")
        end

        def present?
          window_title.present?
        end

        def add_button
          StampsField.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(1)>span>span>span[id$=btnInnerEl]")
        end

        def add
          button=add_button
          store=marketplace
          10.times do
            button.click
            sleep(0.35)
            return store if store.present?
          end
        end

        def marketplace
          Marketplace.new(param)
        end

        def edit
          button=StampsField.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(2)>span>span>span[id$=btnInnerEl]")
          rakuten=RakutenSettings.new(param)
          amazon=AmazonSettings.new(param)
          volusion=VolusionSettings.new(param)
          etsy=EtsySettings.new(param)
          shopify=ShopifySettings.new(param)
          three_d_cart=ThreeDCartSettings.new(param)
          yahoo=YahooSettings.new(param)

          10.times do
            button.click
            sleep(2)
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
          button=StampsField.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(3)>span>span>span[id$=btnInnerEl]")
          expect("No Store selected from Manage Store grid or Reconnect button is not present.  Check your test").to eql "" unless button.present?

          server_error=Orders::Stores::ServerError.new(param)

          amazon=ModifyAmazonStore.new(param)
          volusion=ModifyVolusionStore.new(param)
          rakuten=ModifyRakutenStore.new(param)
          etsy=ModifyEtsyStore.new(param)
          shopify=ModifyShopifyStore.new(param)
          three_d_cart=Modify3DCartStore.new(param)
          yahoo=ModifyYahooStore.new(param)

          15.times do
            button.click
            if server_error.present?
              logger.info server_error.message
              server_error.ok
            end
            5.times do
              if server_error.present?
                error_str=server_error.message
                logger.info error_str
                server_error.ok
                expect("Server Error: \n#{server_error}").to eql ""
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
          button=StampsField.new browser.span(css: "div[componentid^=managestoreswindow]>div[id^=toolbar]>div>div>a:nth-child(4)>span>span>span[id$=btnInnerEl]")
          delete_modal=DeleteStoreModal.new(param)
          10.times do
            button.click
            return delete_modal if delete_modal.present?
            button.click
            return delete_modal if delete_modal.present?
            button.click
            return delete_modal if delete_modal.present?
            button.click
            sleep(0.35)
            return delete_modal if delete_modal.present?
          end
        end

        def manual_orders

        end
      end
=end
    end
  end
end