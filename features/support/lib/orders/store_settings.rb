module Stamps
  module Orders
    module Stores
      module StoresIframe
        def iframe
          (cache[:iframe].nil?)?cache[:iframe]=browser.iframe(css: "[id=storeiframe]"):cache[:iframe]
        end
      end

      module StoreSettingsWindowTitle
        def window_title
          StampsField.new(browser.div(css: "[id^=storeiframewindow-][id$=_header-targetEl] [class$=x-title-item]"))
        end
      end

      module Products
        def auto_add_to_products_page
          (cache[:add_to_products].nil?||!cache[:add_to_products].present?)?cache[:add_to_products]=StampsCheckbox.new(
              iframe.input(id: "addNewProducts"),
              iframe.input(id: "addNewProducts"),
              "class",
              "ng-not-empty"):cache[:add_to_products]
        end

        def sku
          (cache[:sku].nil?||!cache[:sku].present?)?cache[:sku]=StampsRadio.new(
              iframe.label(css: "label[for='sku']"),
              iframe.input(id: 'sku'),
              "class",
              "parse"):cache[:sku]
        end

        def product_listing_name
          (cache[:product_listing_name].nil?||!cache[:product_listing_name].present?)?cache[:product_listing_name]=StampsRadio.new(
              iframe.label(css: "label[for='productListingName']"),
              iframe.input(id: 'productListingName'),
              "class",
              "parse"):cache[:product_listing_name]
        end
      end

      class StoreSettingsShippingService < Browser::Base
        include StoresIframe
        #assign({})
        attr_reader :index
        def initialize(param, index)
          super(param)
          @index = index
        end

        def textbox
          if cache["textbox#{index}".to_sym].nil? || !cache["textbox#{index}".to_sym].present?
            cache["textbox#{index}".to_sym] = StampsTextbox.new(iframe.spans(css: "[class^=ui-select-match][placeholder='Select a Service'] span[ng-hide*=select]")[index])
          end
          cache["textbox#{index}".to_sym]
        end

        def dropdown
          if cache["dropdown#{index}".to_sym].nil? || !cache["dropdown#{index}".to_sym].present?
            cache["dropdown#{index}".to_sym] = StampsField.new(iframe.divs(class: "selectize-input")[index])
          end
        end

        def select(str)
          selection = StampsField.new(selection_field(str))
          10.times do
            dropdown.click unless selection.present?
            selection.scroll_into_view
            selection.click
            return textbox.text if textbox.text.include?(str)
          end
          nil
        end

        private
        def selection_field(str)
          #Version 2. check number of selections, if less than 36, bring them all in.
          #raise error or call Manage Service Options if iframe.spans(css: "[ng-bind-html^='service.PackageStr']").size < 36
          #browser.spans(css: "[ng-bind-html^='service.PackageStr']").size

          case(str)
            when /FCM Large Envelope\/Flat/ #0. FCM Large Envelope/Flat/Flat (1-3 days) -- Large Envelope/Flat
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[0]
            when /FCM Package/ #1. FCM Package/Thick Envelope (1-3 days) -- Package/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[1]
            when /PM Large\/Thick Envelope/ #2. PM Large/Thick Envelope (1-3 days) -- Large/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[2]
            when /PM Package/ #3. PM Package (1-3 days) -- Package
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[3]
            when /PM Large Package/ #4. PM Large Package (1-3 days) -- Large Package
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[4]
            when /PM Flat Rate Envelope/ #5. PM Flat Rate Envelope (1-3 days) -- Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[5]
            when /PM Padded Flat Rate Envelope/ #6. PM Padded Flat Rate Envelope (1-3 days) -- Padded Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[6]
            when /PM Legal Flat Rate Envelope/ #7. PM Legal Flat Rate Envelope (1-3 days) -- Legal Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[7]
            when /PM Small Flat Rate Box/ #8. PM Small Flat Rate Box (1-3 days) -- Small Flat Rate Box
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[8]
            when /PM Medium Flat Rate Box/ #9. PM Medium Flat Rate Box (1-3 days) -- Medium Flat Rate Box
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[9]
            when /PM Large Flat Rate Box/  #10. PM Large Flat Rate Box (1-3 days) -- Large Flat Rate Box
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[10]
            when /PM Regional Rate Box A/ #11. PM Regional Rate Box A (1-3 days) -- Regional Rate Box A
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[11]
            when /PM Regional Rate Box B/ #12. PM Regional Rate Box B (1-3 days) -- Regional Rate Box B
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[12]
            when /PME Package\/Flat\/Thick Envelope/  #13. PME Package/Flat/Thick Envelope/Flat/Thick Envelope (1-2 days) -- Package/Flat/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[13]
            when /PME Flat Rate Envelope/  #14. PME Flat Rate Envelope (1-2 days) -- Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[14]
            when /PME Padded Flat Rate Envelope/ #15. PME Padded Flat Rate Envelope (1-2 days) -- Padded Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[15]
            when /PME Legal Flat Rate Envelope/ #16. PME Legal Flat Rate Envelope (1-2 days) -- Legal Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[16]
            when /MM Package\/Flat\/Thick Envelope/ #17. MM Package/Flat/Thick Envelope/Flat/Thick Envelope (2-9 days) -- Package/Flat/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[17]
            when /PSG Package\/Flat\/Thick Envelope/  #18. PSG Package/Flat/Thick Envelope/Flat/Thick Envelope (2-9 days) -- Package/Flat/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[18]
            when /PSG Large Package/ #19. PSG Large Package (2-9 days) -- Large Package
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[19]
            when /PSG Oversized Package/ #20. PSG Oversized Package (2-9 days) -- Oversized Package
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[20]
            when /FCMI Large Envelope\/Flat/ #21. FCMI Large Envelope/Flat/Flat (1 - 999 days) -- Large Envelope/Flat
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[21]
            when /FCMI Package\/Thick Envelope/ #22. FCMI Package/Thick Envelope/Thick Envelope (1 - 999 days) -- Package/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[22]
            when /PMI Package\/Flat\/Thick Envelope/ #23. PMI Package/Flat/Thick Envelope (6 - 10 days) -- Package/Flat/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[23]
            when /PMI Flat Rate Envelope/ #24. PMI Flat Rate Envelope (6 - 10 days) -- Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[24]
            when /PMI Padded Flat Rate Envelope/ #25. PMI Padded Flat Rate Envelope (6 - 10 days) -- Padded Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[25]
            when /PMI Legal Flat Rate Envelope/ #26. PMI Legal Flat Rate Envelope (6 - 10 days) -- Legal Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[26]
            when /PMI Small Flat Rate Box/ #27. PMI Small Flat Rate Box (6 - 10 days) -- Small Flat Rate Box
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[27]
            when /PMI Medium Flat Rate Box/ #28. PMI Medium Flat Rate Box (6 - 10 days) -- Medium Flat Rate Box
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[28]
            when /PMI Large Flat Rate Box/ #29. PMI Large Flat Rate Box (6 - 10 days) -- Large Flat Rate Box
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[29]
            when /PMI Regional Rate Box A/ #30. PMI Regional Rate Box A (6 - 10 days) -- Regional Rate Box A
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[30]
            when /PMI Regional Rate Box B/ #31. PMI Regional Rate Box B (6 - 10 days) -- Regional Rate Box B
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[31]
            when /PMEI Package\/Flat\/Thick Envelope/ #32. PMEI Package/Flat/Thick Envelope/Flat/Thick Envelope (3 - 5 days) -- Package/Flat/Thick Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[32]
            when /PMEI Flat Rate Envelope/ #33. PMEI Flat Rate Envelope (3 - 5 days) -- Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[33]
            when /PMEI Padded Flat Rate Envelope/ #34. PMEI Padded Flat Rate Envelope (3 - 5 days) -- Padded Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[34]
            when /PMEI Legal Flat Rate Envelope/ #35. PMEI Legal Flat Rate Envelope (3 - 5 days) -- Legal Flat Rate Envelope
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[35]
            when /Manage Service Options/ #36. PMEI Legal Flat Rate Envelope (3 - 5 days) -- Manage Service Options...
              return iframe.spans(css: "[ng-bind-html^='service.PackageStr']")[36]
            else
              raise "#{str} is not a valid service selection."
          end
        end
      end


      class ServiceMapping < Browser::Base
        include StoresIframe
        attr_reader :index
        def initialize(param, index)
          super(param)
          @index = index - 1
        end

        def delete
          if cache["delete#{index}".to_sym].nil? || !cache["delete#{index}".to_sym].present?
            cache["delete#{index}".to_sym] = StampsField.new(iframe.buttons(css: "[class=action remove]")[index])
          end
          cache["delete#{index}".to_sym].scroll_into_view
          cache["delete#{index}".to_sym]
        end

        def requested_service_mapping
          if cache["requested_service_mapping#{index}".to_sym].nil? || !cache["requested_service_mapping#{index}".to_sym].present?
            cache["requested_service_mapping#{index}".to_sym] = StampsTextbox.new(iframe.text_fields(name: "serviceName")[index])
          end
          cache["requested_service_mapping#{index}".to_sym].scroll_into_view
          cache["requested_service_mapping#{index}".to_sym]
        end

        def shipping_service_mapping
          if cache["shipping_service_mapping#{index}".to_sym].nil?
            cache["shipping_service_mapping#{index}".to_sym] = StoreSettingsShippingService.new(param, index)
          end
          cache["shipping_service_mapping#{index}".to_sym].textbox.scroll_into_view
          cache["shipping_service_mapping#{index}".to_sym]
        end

        def present?
          requested_service_mapping.present?
        end

      end


      class ServiceMappingList < Browser::Base
        include StoresIframe
        def add_service_mapping
          if cache[:add_service_mapping].nil? || !cache[:add_service_mapping].present?
            cache[:add_service_mapping] = StampsField.new(iframe.button(css: "[class*='action add']"))
          end
          cache[:add_service_mapping]
        end

        def present?
          add_item.present?
        end

        def size
          iframe.tables(css: "[class^=service-group]").size
        end

        def mapping_number(number)
          cache["mapping_number#{number}".to_sym] = ServiceMapping.new(param, number) if cache["mapping_number#{number}".to_sym].nil?
          5.times do
            if cache["mapping_number#{number}".to_sym].present?
              cache["mapping_number#{number}".to_sym].requested_service_mapping.scroll_into_view
              return cache["mapping_number#{number}".to_sym]
            end

            if number > size
              add_service_mapping.click
              sleep(0.4)
              # expose Made In country list of values on item add
              #cache["mapping_number#{number}".to_sym].made_in.dropdown.click
              #sleep(0.05)
              #cache["mapping_number#{number}".to_sym].made_in.dropdown.click
            end
          end
          nil
        end



      end

      class StoreSettings < Browser::Base
        include StoresIframe
        include StoreSettingsWindowTitle
        include Products

        #assign({})

        def present?
          store_nickname.present?
        end

        def wait_until_present(*args)
          store_nickname.wait_until_present(*args)
        end

        def service_mapping_list
          cache[:service_mapping_list] = ServiceMappingList.new(param) if cache[:service_mapping_list].nil?
          cache[:service_mapping_list]
        end

        def store_nickname
          (cache[:store_nickname].nil?||!cache[:store_nickname].present?)?cache[:store_nickname]=StampsTextbox.new(
              iframe.text_field(id: "storeName")):cache[:store_nickname]
        end

        def auto_import_new_orders
          (cache[:auto_import].nil?||!cache[:v].present?)?cache[:auto_import]=Stamps::Browser::StampsCheckbox.new(
              iframe.input(id: 'importOrders'), iframe.input(id: 'importOrders'), "class", "ng-not-empty"):cache[:auto_import]
        end

        def save
          (cache[:save].nil?||!cache[:save].present?)?cache[:save]=StampsField.new(iframe.button(id: "saveSettings")):cache[:save]
        end

        def remove_service
          (cache[:remove_service].nil?||!cache[:remove_service].present?)?cache[:remove_service]=StampsField.new(iframe.button(class: "action remove")):cache[:remove_service]
        end

        def manage_service_options
          (cache[:manage_service].nil?||!cache[:manage_service].present?)?cache[:manage_service]=StampsField.new(iframe.button(class: "action remove")):cache[:manage_service]
        end

        def service_tooltip(str)
        end

        def general_settings
          (cache[:title_text].nil?||!cache[:title_text].present?)?cache[:title_text]= StampsField.new(iframe.h3(css: "div[class^='storeEdit']>form>h3")):cache[:title_text]
        end
      end
    end
  end
end