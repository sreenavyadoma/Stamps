module Stamps
  module Orders
    class WebOrders < Browser::StampsModal
      def cache
        @cache ||= {}
      end

      def present?
        orders_grid.present?
      end

      def orders_toolbar
        (cache[:orders_toolbar].nil? || !cache[:orders_toolbar].present?)?cache[:orders_toolbar] = Toolbar::OrdersToolbar.new(param):cache[:orders_toolbar]
      end

      def landing_page
        (cache[:landing_page].nil? || !cache[:landing_page].present?)?cache[:landing_page] = Orders::Authentication::OrdersLandingPage.new(param):cache[:landing_page]
      end

      def filter_panel
        (cache[:filter_panel].nil? || !cache[:filter_panel].present?)?cache[:filter_panel] = Orders::LeftPanel::FilterPanel.new(param):cache[:filter_panel]
      end

      def orders_grid
        (cache[:orders_grid].nil? || !cache[:orders_grid].present?)?cache[:orders_grid] = Orders::Grid::OrdersGrid.new(param):cache[:orders_grid]
      end

      def single_order_details
        (cache[:single_order_details].nil? || cache[:single_order_details].present?)?cache[:single_order_details] = Orders::Details::SingleOrderDetails.new(param):cache[:single_order_details]
      end

      def multi_order_details
        (cache[:multi_order_details].nil? || !cache[:multi_order_details].present?)?cache[:multi_order_details] = Orders::MultiOrderDetails::MultiOrderDetailsForm.new(param):cache[:multi_order_details]
      end

      def orders_print_modal
        (cache[:orders_print_modal].nil? || !cache[:orders_print_modal].present?)?cache[:orders_print_modal] =  Stamps::Orders::OrdersPrintModal.new(param):cache[:orders_print_modal]
      end

      def orders_settings
        (cache[:orders_settings].nil? || !cache[:orders_settings].present?)?cache[:orders_settings] =  Stamps::Orders::Toolbar::SettingsMenu.new(param):cache[:orders_settings]
      end

      def styles
        (cache[:styles].nil? || !cache[:styles].present?)?cache[:styles] = PageStyles.new(param):cache[:styles]
      end
    end
  end
end