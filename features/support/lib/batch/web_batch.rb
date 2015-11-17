module Batch

  class WebBatch < BatchObject

    def navigation
      @navigation_bar ||= Navigation.new @browser
    end

    def toolbar
      @toolbar ||= Toolbar.new @browser
    end

    def sign_in_page
      @sign_in ||= Batch::SignInPage.new @browser
    end

    def awaiting_shipment
      FilterPanel.new(@browser).filter "Awaiting Shipment"
      Grid.new @browser
    end

    def shipped
      FilterPanel.new(@browser).filter "Shipped"
      Grid.new @browser
    end

    def filter
      Batch::FilterPanel.new @browser
    end

    def multi_order
      MultiOrder.new(@browser)
    end

    def order_details
      @order_details ||= OrderDetails.new @browser
    end

    def grid
      @grid ||= Grid.new(@browser)
    end

    def styles
      #(Navigation.new @browser).orders
      @page_styles ||= PageStyles.new @browser
    end
  end

end