module Stamps
  module Orders
    module SdcOrdersInstHelper

    end

    class SdcOrders < SdcPageObject
      element(:loading_orders) { {text: 'Loading orders...'} }

      def order_details
        @order_details = nil
      end

      def bulk_update
        @bulk_update = nil
      end

      def navigation
        @navigation ||= Object.const_get('SdcNavigation').new
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

