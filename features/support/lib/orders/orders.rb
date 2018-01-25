module Stamps
  module Orders
    class WebOrders < Browser::BaseCache
      assign({})

      def orders_toolbar
        cache[:orders_toolbar] = Orders::Toolbar::OrdersToolbar.new(param) if cache[:orders_toolbar].nil?
        cache[:orders_toolbar]
      end

      def landing_page
        cache[:landing_page] = Orders::Authentication::OrdersLandingPage.new(param) if cache[:landing_page].nil?
        cache[:landing_page]
      end

      def filter_panel
        cache[:filter_panel] = Orders::LeftPanel::FilterPanel.new(param) if cache['filter_panel'].nil?
        cache[:filter_panel]
      end

      def orders_grid
        cache[:orders_grid] = Orders::Grid::OrdersGrid.new(param) if cache[:orders_grid].nil?
        cache[:orders_grid]
      end

      def order_details
        cache[:single_order] = Orders::SingleOrder::DetailsForm.new(param) if cache[:single_order].nil?
        cache[:single_order]
      end

      def bulk_update
        cache[:bulk_update] = Orders::BulkUpdate::Form.new(param) if cache[:bulk_update].nil?
        cache[:bulk_update]
      end

      def modals
        cache[:modals] = Stamps::Orders::StampsOrdersModals.new(param) if cache[:modals].nil?
        cache[:modals]
      end

      def marketplace
        cache[:marketplace] = Stamps::Orders::MarketPlaceStoreModals.new(param) if cache[:marketplace].nil?
        cache[:marketplace]
      end

      def styles
        cache[:styles] = PageStyles.new(param) if cache[:styles].nil?
        cache[:styles]
      end

      def external_sites
        (cache[:external_sites].nil?||!cache[:external_sites].present?)?cache[:external_sites]=Base.new(param).extend(StampsExternalSites):cache[:external_sites]
      end

      def present?
        orders_grid.present?
      end
    end
  end
end