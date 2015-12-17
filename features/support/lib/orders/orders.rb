module Orders

  class PrintOrders < OrdersObject

    def navbar
      Orders::NavBar.new @browser
    end

    def toolbar
      @toolbar ||= Orders::Toolbar.new @browser
    end

    def sign_in_page
      Orders::SignInPage.new @browser
    end

    def awaiting_shipment
      FilterPanel.new(@browser).filter "Awaiting Shipment"
      OrdersGrid.new @browser
    end

    def shipped
      FilterPanel.new(@browser).filter "Shipped"
      OrdersGrid.new @browser
    end

    def filter
      Orders::FilterPanel.new @browser
    end

    def multi_order
      MultiOrder.new(@browser)
    end

    def details
      @order_details ||= OrderDetails.new @browser
    end

    def grid
      @grid ||= OrdersGrid.new(@browser)
    end

    def styles
      #(Navigation.new @browser).orders
      @page_styles ||= PageStyles.new @browser
    end
  end

end