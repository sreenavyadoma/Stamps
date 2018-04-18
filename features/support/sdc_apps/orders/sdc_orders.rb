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
        @order_details ||= SdcOrderDetails.new
      end

      def bulk_update
        @bulk_update = nil
      end

      def toolbar
        @toolbar ||= SdcOrdersToolbar.new
      end

      def grid

      end

      def filter_panel
        @filter_panel ||= SdcOrdersFilterPanel.new
      end

      def modals
        @modals ||= SdcOrdersModals.new
      end
    end
  end
end

