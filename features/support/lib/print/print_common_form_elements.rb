# encoding: utf-8
module Print
  module Postage
    class DomesticCommon < PrintObject
      def ship_to
        Postage::ShipToDomestic.new @browser
      end
    end
  end
end
#todo-rob rename this