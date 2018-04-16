module Stamps
  module Orders
    class SdcOrdersToolbar < SdcPage
      page_obj(:add) { {xpath: '//div[contains(@class, "sdc-toolbar")]//span[text()="Add"]/../..'} }
    end
  end
end