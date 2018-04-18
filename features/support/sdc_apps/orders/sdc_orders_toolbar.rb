module Stamps
  module Orders
    class SdcOrdersToolbar < SdcPage
      page_obj(:add, required: true, timeout: 45) { {xpath: '//div[contains(@class, "sdc-toolbar")]//span[text()="Add"]/../..'} }
    end
  end
end