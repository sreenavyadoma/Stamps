module SdcOrders

  class SdcOrdersToolbar < SdcPage
    page_object(:add, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Add"]'} }
    page_object(:settings) { {id: 'settingsButton-btnWrap'} }
  end

end
