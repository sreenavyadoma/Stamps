# encoding: utf-8
module Print
  module Postage
    class Roll < DomesticCommon

      def ship_from
        Print::Postage::ShipFrom.new @browser
      end

      def ship_to
        Print::Postage::ShipToDomestic.new @browser
      end

      def email_tracking
        Print::Postage::Email.new @browser
      end

      def weight
        Print::Postage::Weight.new @browser
      end

      def service
        Print::Postage::Service.new @browser
      end

      def insure_for
        Print::Postage::InsureFor.new @browser
      end

      def extra_services
        Print::Postage::ExtraServices.new @browser
      end

      def ship_date
        Print::Postage::ShipDate.new @browser
      end
    end
  end
end