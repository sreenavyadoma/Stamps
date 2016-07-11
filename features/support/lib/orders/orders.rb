module Stamps
  module Orders
    class WebOrders < Browser::Modal
      def navigation_bar
        @nav_bar ||= Orders::Navigation::NavigationBar.new param
      end

      def toolbar
        @toolbar ||= Orders::Toolbar::Toolbar.new param
      end

      def landing_page
        @landing_page ||= Orders::LandingPage::SignInPage.new param
      end

      def awaiting_shipment
        FilterPanel.new(param).FilterPanel - "Awaiting Shipment"
        @grid ||= Orders::Grid::OrdersGrid.new param
      end

      def shipped
        FilterPanel.new param.FilterPanel - "Shipped"
        @grid ||= Orders::Grid::OrdersGrid.new param
      end

      def filter
        @filter ||= Orders::FilterPanel.new param
      end

      def multi_order
        @multi_order ||= Orders::Details::MultiOrder.new param
      end

      def details
        @details ||= Orders::Details::DetailsForm.new param
      end

      def grid
        @grid ||= Orders::Grid::OrdersGrid.new param
      end

      def styles
        @styles ||= PageStyles.new param
      end
    end
  end
end