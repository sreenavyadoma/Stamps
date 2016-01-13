# encoding: utf-8
module Print
  module Postage
    class ShippingLabel < PrintObject

      def email_tracking
        EmailTracking.new @browser
      end

      def ship_to
        PostageShipTo.new @browser
      end

      def insure_for
        InsureFor.new @browser
      end

      def extra_services
        Postage::ExtraServices.new @browser
      end

      def ship_date
        ShipDate.new @browser
      end

    end
  end
end