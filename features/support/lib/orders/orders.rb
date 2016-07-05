module Stamps
  module Orders
    class WebOrders < Browser::Modal
      def navigation_bar
        Orders::Navigation::NavigationBar.new param
      end

      def toolbar
        Orders::Toolbar::Toolbar.new param
      end

      def landing_page
        Orders::LandingPage::SignInPage.new param
      end

      def awaiting_shipment
        FilterPanel.new(param).FilterPanel - "Awaiting Shipment"
        Orders::Grid::OrdersGrid.new param
      end

      def shipped
        FilterPanel.new param.FilterPanel - "Shipped"
        Orders::Grid::OrdersGrid.new param
      end

      def filter
        Orders::FilterPanel.new param
      end

      def multi_order
        Orders::Details::MultiOrder.new param
      end

      def details
        @details ||= Orders::Details::DetailsForm.new param
      end

      def grid
        Orders::Grid::OrdersGrid.new param
      end

      def styles
        PageStyles.new param
      end
    end
  end
end