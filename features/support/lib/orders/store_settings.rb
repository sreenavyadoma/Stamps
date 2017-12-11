module Stamps
  module Orders
    module Stores

      module StoreIframe
        def store_iframe
          browser.iframe(css: "[id=storeiframe]")
        end
      end

      module GenSetStoreNickname
        include StoreIframe
        def store_nickname
          (cache[:store_nickname].nil?||!cache[:store_nickname].present?)?cache[:store_nickname]=StampsField.new(iframe.text_field(id: "storeName")):cache[:store_nickname]
        end

        def auto_import_new_orders
          (cache[:auto_import].nil?||!cache[:v].present?)?cache[:auto_import]=Stamps::Browser::StampsCheckbox.new(
              store_iframe.input(id: 'importOrders'), store_iframe.input(id: 'importOrders'), "class", "not_empty"):cache[:auto_import]
        end
      end

      module GenSetServiceMapping
        class GenSetServiceMappingField < Browser::StampsModal
          def textbox
          end

          def dropdown
          end

          def selection(str)
          end

          def remove_service

          end

          def select_service(str)
          end
        end

        def requested_service
          (cache[:requested_service].nil?||!cache[:requested_service].present?)?cache[:requested_service]=StampsField.new(iframe.text_field(name: "serviceName")):cache[:requested_service]
        end

        def shipping_service
        end
      end
    end
  end
end