
module SdcOrders
  class << self
    def loading_orders
      klass = Class.new(SdcPage) do
        page_object(:loading) { { xpath: '//*[contains(text(), "Loading orders...")]' } }
      end
      klass.new.loading
    end

    def updating_orders
      klass = Class.new(SdcPage) do
        page_object(:updating) { { xpath: '//*[text()="Updating Orders"]' } }
      end

      klass.new.updating
    end

    def initializing_orders_db
      klass = Class.new(SdcPage) do
        page_object(:initializing_orders) { { xpath: '//*[text()="Initializing Order Database"]' } }
      end
      klass.new.initializing_orders
    end

    def order_details
      SdcOrderDetails.new
    end

    def bulk_update
      SdcBulkUpdate.new
    end

    def toolbar
      SdcOrdersToolbar.new
    end

    def grid
      SdcGrid
    end

    def filter_panel
      SdcOrdersFilterPanel.new
    end

    def modals
      SdcOrdersModals
    end
  end

end
