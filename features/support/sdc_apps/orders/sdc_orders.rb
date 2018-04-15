module Stamps
  module Orders
    module SdcOrdersInstHelper

    end

    class SdcOrders < SdcPage
      page_obj(:loading_orders) { {text: 'Loading orders...'} }
      page_obj(:signed_in_user, tag: :a) { {id: "username"} }
      page_obj(:grid_body, required: true) { {xpath: "//*[contains(@class, 'orders-grid')]"} }

      def order_details
        @order_details = nil
      end

      def bulk_update
        @bulk_update = nil
      end

      def toolbar

      end

      def grid

      end

      def left_filter_panel

      end

      def paging_toolbar

      end
    end
  end
end

