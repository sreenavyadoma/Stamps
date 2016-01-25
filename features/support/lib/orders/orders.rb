module Orders

  class PrintOrders < OrdersObject

    def navigation_bar
      Orders::Navigation::NavigationBar.new @browser
    end

    def toolbar
      Orders::Toolbar::Toolbar.new @browser
    end

    def sign_in_page
      Orders::LandingPage::SignInPage.new @browser
    end

    def awaiting_shipment
      FilterPanel.new(@browser).Filter Panel - "Awaiting Shipment"
      Orders::Grid::OrdersGrid.new @browser
    end

    def shipped
      FilterPanel.new(@browser).Filter Panel - "Shipped"
      Orders::Grid::OrdersGrid.new @browser
    end

    def filter
      Orders::FilterPanel.new @browser
    end

    def multi_order
      Orders::Details::MultiOrder.new(@browser)
    end

    def details
      Orders::Details::OrderDetails.new @browser
    end

    def grid
      Orders::Grid::OrdersGrid.new(@browser)
    end

    def styles
      PageStyles.new @browser
    end
  end

end