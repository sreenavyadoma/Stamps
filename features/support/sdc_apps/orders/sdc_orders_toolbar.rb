module Stamps
  module Orders
    class SdcOrdersToolbar < SdcPageObject
      element(:add) { {xpath: '//div[contains(@class, "sdc-toolbar")]//span[text()="Add"]/../..'} }
    end
  end
end