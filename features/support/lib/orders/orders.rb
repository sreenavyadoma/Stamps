module Stamps
  module Orders
    class WebOrders < Browser::Modal
      attr_reader :toolbar, :landing_page, :grid, :styles, :details, :filter, :multi_order
      def initialize param
        super param
        @toolbar ||= Orders::Toolbar::Toolbar.new param
        @landing_page ||= Orders::OrdersLandingPage.new param
        @grid ||= Orders::Grid::OrdersGrid.new param
        @styles ||= PageStyles.new param
        @details ||= Orders::Details::SingleOrderDetails.new param
        @filter ||= Orders::FilterPanel.new param
        @multi_order ||= Orders::Details::MultiOrderDetails.new param
      end

      def present?
        grid.present?
      end

      def awaiting_shipment
        FilterPanel.new(param).FilterPanel - "Awaiting Shipment"
        grid
      end

      def shipped
        FilterPanel.new param.FilterPanel - "Shipped"
        grid
      end
    end
  end
end