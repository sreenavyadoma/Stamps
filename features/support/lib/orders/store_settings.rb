module Stamps
  module Orders
    module Stores

      module StoreIframe
        def store_iframe
          browser.iframe(css: "[id=storeiframe]")
        end
      end

      module StoSetStoreNickname
        def store_nickname
          (cache[:store_nickname].nil?||!cache[:store_nickname].present?)?cache[:store_nickname]=StampsField.new(iframe.text_field(id: "storeName")):cache[:store_nickname]
        end
      end

      module StoSetAutoImpNewOrders
        def auto_import_new_orders
          (cache[:store_nickname].nil?||!cache[:store_nickname].present?)?cache[:store_nickname]=StampsField.new(iframe.text_field(id: "storeName")):cache[:store_nickname]

        end
      end
    end
  end
end