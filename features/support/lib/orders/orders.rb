module Stamps
  module Orders
    class WebOrders < Browser::StampsModal
      def orders_toolbar
        @orders_toolbar = Toolbar::OrdersToolbar.new(param) if @orders_toolbar.nil? || !@orders_toolbar.present?
        @orders_toolbar
      end

      def landing_page
        @landing_page = Orders::Authentication::OrdersLandingPage.new(param) if @landing_page.nil? || !@landing_page.present?
        @landing_page
      end

      def filter_panel
        @filter_panel = Orders::LeftPanel::FilterPanel.new(param) if @filter_panel.nil? || !@filter_panel.present?
        @filter_panel
      end

      def orders_grid
        @orders_grid = Orders::Grid::OrdersGrid.new(param) if @orders_grid.nil? || !@orders_grid.present?
        @orders_grid
      end

      def single_order_details
        @single_order_details = Orders::Details::SingleOrderDetails.new(param) if @single_order_details.nil? || @single_order_details.present?
        @single_order_details
      end

      def multi_order_details
        @multi_order_details = Orders::MultiOrderDetails::MultiOrderDetailsForm.new(param) if @multi_order_details.nil? || !@multi_order_details.present?
        @multi_order_details
      end

      def styles
        @styles = PageStyles.new(param) if @styles.nil? || !@styles.present?
        @styles
      end

      def present?
        grid.present?
      end
    end
  end
end