module Stamps
  module Orders
    class WebOrders < Browser::StampsBrowserElement
      attr_reader :orders_toolbar, :landing_page, :orders_grid, :styles, :order_details, :filter_panel, :multi_order

      def initialize(param)
        super(param)
        @orders_toolbar = Toolbar::OrdersToolbar.new(param)
        @landing_page = Orders::OrdersLandingPage.new(param)
        @orders_grid = Orders::Grid::OrdersGrid.new(param)
        @styles = PageStyles.new(param)
        @order_details = Orders::Details::SingleOrderDetails.new(param)
        @filter_panel = Orders::LeftPanel::FilterPanel.new(param)
        @multi_order = Orders::Details::MultiOrderDetails.new(param)
      end

      def present?
        grid.present?
      end
    end
  end
end