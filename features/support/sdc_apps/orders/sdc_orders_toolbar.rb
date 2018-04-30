module SdcOrders

  class SdcOrdersToolbar < SdcPage
    page_object(:add, required: true, timeout: 45) { {xpath: '//span[text()="Add"]'} }
  end

end
