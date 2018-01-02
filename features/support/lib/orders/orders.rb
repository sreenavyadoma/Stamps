module Stamps
  module Orders
    class WebOrders < Browser::BaseCache
      assign({})
      def cache
        self.class.cache
      end

      def orders_toolbar
        (cache[:orders_toolbar].nil?||!cache[:orders_toolbar].present?)?cache[:orders_toolbar]=Toolbar::OrdersToolbar.new(param):cache[:orders_toolbar]
      end

      def landing_page
        (cache[:landing_page].nil?||!cache[:landing_page].present?)?cache[:landing_page]=Orders::Authentication::OrdersLandingPage.new(param):cache[:landing_page]
      end

      def filter_panel
        (cache[:filter_panel].nil?||!cache[:filter_panel].present?)?cache[:filter_panel]=Orders::LeftPanel::FilterPanel.new(param):cache[:filter_panel]
      end

      def orders_grid
        (cache[:orders_grid].nil?||!cache[:orders_grid].present?)?cache[:orders_grid]=Orders::Grid::OrdersGrid.new(param):cache[:orders_grid]
      end

      def single_order_details
        (cache[:single_order].nil?||!cache[:single_order].present?)?cache[:single_order]=Orders::Details::SingleOrderDetails.new(param):cache[:single_order]
      end

      def bulk_update
        (cache[:bulk_update].nil?||!cache[:bulk_update].present?)?cache[:bulk_update]=Orders::BulkUpdate::Form.new(param):cache[:bulk_update]
      end

      def modals
        (cache[:modals].nil?||!cache[:modals].present?)?cache[:modals]=Stamps::Browser::Base.new(param).extend(StampsOrdersModals):cache[:modals]
      end

      def marketplace
        (cache[:marketplace].nil?||!cache[:marketplace].present?)?cache[:marketplace]=Stamps::Browser::Base.new(param).extend(MarketPlaceStoreModals):cache[:marketplace]
      end

      def styles
        (cache[:styles].nil?||!cache[:styles].present?)?cache[:styles]=PageStyles.new(param):cache[:styles]
      end

      def present?
        orders_grid.present?
      end
    end
  end
end