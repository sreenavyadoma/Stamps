module SdcOrders

  class SdcOrdersToolbar < SdcPage
    page_object(:add, required: true, timeout: 45) { {xpath: '//div[contains(@class, "sdc-toolbar")]//span[text()="Add"]/../..'} }
  end

end
