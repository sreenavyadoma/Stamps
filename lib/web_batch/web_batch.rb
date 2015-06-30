module Batch
  class WebBatch < BatchPage
    def sign_in(*args)
      LoginPage.new(@browser).sign_in *args
    end

    def single_order
      SingleOrder.new(@browser)
    end

    def grid
      Grid.new(@browser)
    end
  end
end