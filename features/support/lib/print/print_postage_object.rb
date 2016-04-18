# encoding: utf-8
module Print
  module Postage
    class PrintPostageCustoms < Print::Postage::PrintObject
      def edit_form
        button = StampsButton.new @browser.span :id => "sdc-mainpanel-editcustombtn-btnIconEl"
        customs_modal = Print::Postage::CustomsForm.new @browser
        5.times do
          button.safe_click
          sleep 1
          return customs_modal if customs_modal.present?
        end
        stop_test "Unable to open Customs Modal, check your test." unless customs_modal.present?
      end

      def restrictions

      end

      def i_agree_to_insurance_terms
        #return a StampsCheckbox object.
      end
    end

    class PrintPostageObject < Print::Postage::PrintObject
      def ship_from
        Print::Postage::ShipFrom.new @browser
      end

      def ship_to
        Print::Postage::ShipTo.new @browser
      end

      def customs
        PrintPostageCustoms.new @browser
      end
    end
  end
end