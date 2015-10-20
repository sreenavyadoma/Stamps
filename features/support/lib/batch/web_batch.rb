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

=begin
    def visit *args
      @sign_in ||= Batch::SignInPage.new(@browser)
      @sign_in.visit *args
      self
    end

    def sign_in *args
      @sign_in ||= Batch::SignInPage.new(@browser)
      @sign_in.sign_in *args
    end
=end

    def awaiting_shipment
      #todo-elie here are your steps;
      Filters.new(@browser).filter "Awaiting Shipment"
      Grid.new @browser
    end

    def shipped
      #todo-elie here are your steps;
      Filters.new(@browser).filter "Shipped"
      Grid.new @browser
    end

    def filters_panel
      Filters.new @browser
    end

    def multi_order
      MultiOrder.new(@browser)
    end

    def single_order_form
      SingleOrderForm.new(@browser)
    end

    def grid
      Grid.new(@browser)
    end

    def styles
      #(Navigation.new @browser).orders
      @page_styles ||= PageStyles.new @browser
    end
  end

end