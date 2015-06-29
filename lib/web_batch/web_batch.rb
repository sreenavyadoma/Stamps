module Batch

  def setup
    @batch = Batch::WebBatch.new(Stamps.setup)
  end

  def batch
    @batch
  end

  def teardown
    Stamps.teardown
  end

  def new_order_row
    1
  end

  class WebBatch < Batch::BatchPage
    #require_relative 'login_page'
    #require_relative 'single_order'
    #require_relative 'grid'

    def sign_in(*args)
      LoginPage.new(@browser).sign_in *args
    end

    def single_order
      @single_order_form ||= SingleOrder.new(@browser)
    end

    def grid
      @grid ||= Grid.new(@browser)
    end

  end

end