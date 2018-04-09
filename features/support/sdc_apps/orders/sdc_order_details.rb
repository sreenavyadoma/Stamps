module Stamps
  module Orders
    class SdcOrderDetails < SdcPageObject
      element(:title) { {xpath: '//div[contains(@class, "singleorder-detailsform")]//label[contains(@class, "panel-header-text")]'} }


      def present?

      end
    end
  end
end