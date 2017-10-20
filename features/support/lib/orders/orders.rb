module Stamps
  module Orders
    class WebOrders < Browser::StampsModal
      def modals
        @modals ||= {}
      end

      def present?
        orders_grid.present?
      end

      def orders_toolbar
        modals[:orders_toolbar] = Toolbar::OrdersToolbar.new(param) if modals[:orders_toolbar].nil? || !modals[:orders_toolbar].present?
        modals[:orders_toolbar]
      end

      def landing_page
        modals[:landing_page] = Orders::Authentication::OrdersLandingPage.new(param) if modals[:landing_page].nil? || !modals[:landing_page].present?
        modals[:landing_page]
      end

      def filter_panel
        modals[:filter_panel] = Orders::LeftPanel::FilterPanel.new(param) if modals[:filter_panel].nil? || !modals[:filter_panel].present?
        modals[:filter_panel]
      end

      def orders_grid
        modals[:orders_grid] = Orders::Grid::OrdersGrid.new(param) if modals[:orders_grid].nil? || !modals[:orders_grid].present?
        modals[:orders_grid]
      end

      def single_order_details
        modals[:single_order_details] = Orders::Details::SingleOrderDetails.new(param) if modals[:single_order_details].nil? || modals[:single_order_details].present?
        modals[:single_order_details]
      end

      def multi_order_details
        modals[:multi_order_details] = Orders::MultiOrderDetails::MultiOrderDetailsForm.new(param) if modals[:multi_order_details].nil? || !modals[:multi_order_details].present?
        modals[:multi_order_details]
      end

      def orders_print_modal
        modals[:orders_print_modal] =  Stamps::Orders::OrdersPrintModal.new(param) if modals[:orders_print_modal].nil? || !modals[:orders_print_modal].present?
        modals[:orders_print_modal]
      end

      def orders_settings
        modals[:orders_settings] =  Stamps::Orders::Toolbar::SettingsMenu.new(param) if modals[:orders_settings].nil? || !modals[:orders_settings].present?
        modals[:orders_settings]
      end

      def styles
        modals[:styles] = PageStyles.new(param) if modals[:styles].nil? || !modals[:styles].present?
        modals[:styles]
      end
    end
  end
end