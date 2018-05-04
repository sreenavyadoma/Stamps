
module SdcOrders
  class LoadingPopUp < SdcPage
    page_object(:loading_orders) { {text: 'Loading orders...'} }
  end

  class << self
    def loading_popup
      LoadingPopUp.new.loading_orders
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
