module Stamps
  module SdcOrders
    class LoadingPopUp < SdcPage
      page_obj(:loading_orders) { {text: 'Loading orders...'} }
    end

    class << self
      def loading_popup
        LoadingPopUp.new.loading_orders
      end

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

