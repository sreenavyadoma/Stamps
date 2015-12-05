module Batch

  class WebBatch < BatchObject

    def navbar
      @navigation_bar ||= Batch::NavBar.new @browser
    end

    def toolbar
      @toolbar ||= Batch::Toolbar.new @browser
    end

    def sign_in_page
      @sign_in ||= Batch::SignInPage.new @browser
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
      @filter ||= Batch::FilterPanel.new @browser
    end

    def multi_order
      MultiOrder.new(@browser)
    end

    def order_details
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