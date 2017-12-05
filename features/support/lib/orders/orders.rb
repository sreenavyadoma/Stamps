module Stamps
  module Orders
    class WebOrders < Browser::StampsModal
      include StampsOrdersModals
      
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
        (cache[:single_order_details].nil?||!cache[:single_order_details].present?)?cache[:single_order_details]=Orders::Details::SingleOrderDetails.new(param):cache[:single_order_details]
      end

      def multi_order_details
        (cache[:multi_order_details].nil?||!cache[:multi_order_details].present?)?cache[:multi_order_details]=Orders::MultiOrderDetails::MultiOrderDetailsForm.new(param):cache[:multi_order_details]
      end

      def marketplace
        (cache[:marketplace].nil?||!cache[:marketplace].present?)?cache[:marketplace]=StampsModal.new(param).extend(Orders::Stamps::MarketPlaceStoreModals):cache[:marketplace]
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