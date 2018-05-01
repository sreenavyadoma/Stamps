module Stamps
  module Orders
    class SdcOrdersFilterAwaitingShip < SdcPage
      page_object(:count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-first")]//div[@class="sdc-badge"])[2]'} }
      link(:awaiting) { {xpath: '(//*[contains(@class, "sdc-badgebutton-first")])[2]'} }
    end

    class SdcOrdersFilterPanel < SdcPage
      def awaiting_shipment
        @awaiting_shipment = SdcOrdersFilterAwaitingShip.new
      end

      def shipped

      end

      def canceled

      end

      def on_hold

      end
    end
  end
end
