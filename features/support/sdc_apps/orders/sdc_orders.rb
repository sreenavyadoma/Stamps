
module SdcOrders
  class LoadingOrders < SdcPage
    def initialize
      @loading_orders = browser.element(text: 'Loading orders...')
    end

    def respond_to?(name, include_private = false)
      @loading_orders.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args &block)
      super unless @loading_orders.respond_to? name
      @loading_orders.send(name, *args, &block)
    end
  end

  class << self
    def loading
      LoadingOrders.new
    end

    def order_details
      SdcOrderDetails.new
    end

    def bulk_update
      raise ArgumentError, 'Not Implemented'
    end

    def toolbar
      SdcOrdersToolbar.new
    end

    def grid
      SdcOrdersGrid.new
    end

    def filter_panel
      SdcOrdersFilterPanel.new
    end

    def modals
      SdcOrdersModals.new
    end
  end
end
