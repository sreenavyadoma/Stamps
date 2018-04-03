module Stamps
  module Orders
    class WebOrders < WebApps::Base

      def orders_toolbar
        @orders_toolbar ||= ::Toolbar::OrdersToolbar.new(param)
      end

      def landing_page
        @landing_page ||= ::Authentication::OrdersLandingPage.new(param)
      end

      def filter_panel
        @filter_panel ||= ::LeftPanel::FilterPanel.new(param)
      end

      def orders_grid
        @orders_grid ||= ::Grid::OrdersGrid.new(param)
      end

      def order_details
        @order_details ||= ::SingleOrder::OrderDetails.new(param)
      end

      def bulk_update
        @bulk_update ||= ::SdcBulkUpdate::Form.new(param)
      end

      def modals
        @xxxxx ||= ::Orders::StampsOrdersModals.new(param)
      end

      def marketplace
        @xxxxx ||= ::Orders::MarketPlaceStoreModals.new(param)
      end

      def styles
        @xxxxx ||= PageStyles.new(param)
      end

      def external_sites
        @xxxxx ||= Object.const_get('WebApps::Base').new(param).extend(StampsExternalSites)
      end

      def present?
        orders_grid.present?
      end
    end
  end
end