# encoding: utf-8
module Print
  module Postage
    class PrintPostageCustoms < Print::Postage::PrintObject
    end

    class PrintPostage < Print::Postage::PrintObject
      def ship_from
        Print::Postage::ShipFrom.new @browser
      end

      def ship_to
        Print::Postage::ShipTo.new @browser
      end

      def customs
        button = StampsButton.new @browser.span :id => "sdc-mainpanel-editcustombtn-btnIconEl"
        customs_modal = Print::Postage::CustomsForm.new @browser
        5.times do
          button.safe_click
          sleep 1
          return customs_modal if customs_modal.present?
        end
        stop_test "Unable to open Customs Modal, check your code." unless customs_modal.present?
      end
    end
  end
end