module Print
  module Postage
    class Envelope < PrintObject

      def ship_from
        Postage::ShipFrom.new @browser
      end

      def ship_to_domestic
        Postage::ShipToDomestic.new @browser
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
        Postage::ShipDate.new @browser
      end

    end
  end
end