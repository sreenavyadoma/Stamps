
module SdcOrders

  def loading_orders
    klass = Class.new(SdcPage) do
      page_object(:loading) { {xpath: '//*[contains(text(), "Loading orders...")]'} }
    end

    klass.new.loading
  end
  module_function :loading_orders

  def order_details
    SdcOrderDetails.new
  end
  module_function :order_details

  def bulk_update
    raise ArgumentError, 'Not Implemented'
  end
  module_function :bulk_update

  def toolbar
    SdcOrdersToolbar.new
  end
  module_function :toolbar

  def grid
    SdcOrdersGrid.new
  end
  module_function :grid

  def filter_panel
    SdcOrdersFilterPanel.new
  end
  module_function :filter_panel

  def modals
    OrdersFloatingModals
  end
  module_function :modals

end
