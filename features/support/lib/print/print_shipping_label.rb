# encoding: utf-8
module Print
  module Postage
    class ShippingLabel < DomesticCommon

      def ship_to
        Postage::ShipToDomestic.new @browser
      end

      def email_tracking
        Postage::Email.new @browser
      end

      def weight
        Postage::Weight.new @browser
      end

      def service
        Postage::Service.new @browser
      end

      def insure_for
        Postage::InsureFor.new @browser
      end

      def extra_services
        Postage::ExtraServices.new @browser
      end

      def ship_date
        Print::Postage::ShipDate.new @browser
      end

    end
  end
end