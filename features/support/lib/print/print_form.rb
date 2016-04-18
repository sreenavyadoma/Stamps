# encoding: utf-8
module Print
  module Postage
    class PrintForm < Print::Postage::PrintObject

      def ship_from
        Print::Postage::ShipFrom.new @browser
      end

      def ship_to
        Print::Postage::ShipTo.new @browser
      end
    end
  end
end
#todo-rob rename this