module Orders

  class PrintOrders < OrdersObject

    def navbar
      Orders::NavBar.new @browser
    end

    def toolbar
      Orders::Toolbar::Toolbar.new @browser
    end

    def sign_in_page
      Orders::LandingPage::SignInPage.new @browser
    end

    def awaiting_shipment
      FilterPanel.new(@browser).filter "Awaiting Shipment"
      Orders::Grid::OrdersGrid.new @browser
    end

    def shipped
      FilterPanel.new(@browser).filter "Shipped"
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
      @grid ||= Orders::Grid::OrdersGrid.new(@browser)
    end

    def styles
      #(Navigation.new @browser).orders
      @page_styles ||= PageStyles.new @browser
    end
  end

end