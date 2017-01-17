module Stamps
  module Orders
    class WebOrders < Browser::Modal
      attr_reader :toolbar, :landing_page, :grid, :styles, :order_details, :left_panel, :multi_order
      def initialize param
        super(param)
        @toolbar ||= Orders::Toolbar::Toolbar.new param
        @landing_page ||= Orders::OrdersLandingPage.new param
        @grid ||= Orders::Grid::OrdersGrid.new param
        @styles ||= PageStyles.new param
        @order_details ||= Orders::Details::SingleOrderDetails.new param
        @left_panel ||= Orders::LeftPanel::LeftFilterPanel.new param
        @multi_order ||= Orders::Details::MultiOrderDetails.new param
      end

      def present?
        grid.present?
      end
    end
  end
end