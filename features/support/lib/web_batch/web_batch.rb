module Batch
  class WebBatch < BatchPage
    def sign_in(*args)
      LoginPage.new(@browser).sign_in *args
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
  end
end