# encoding: utf-8
module Print
  module Postage
    class Roll < Print::Postage::PrintPostageObject

      def insure_for
        Print::Postage::InsureFor.new @browser
      end

      def ship_date
        Print::Postage::ShipDate.new @browser
      end
    end
  end
end