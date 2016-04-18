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

      def service
        Print::Postage::Service.new @browser
      end

      def email_tracking
        Print::Postage::Email.new @browser
      end

      def weight
        Print::Postage::Weight.new @browser
      end

      def ship_from
        Print::Postage::ShipFrom.new @browser
      end

      def ship_to
        Print::Postage::ShipTo.new @browser
      end

      def customs
        PrintPostageCustoms.new @browser
      end

      def extra_services
        button = StampsButton.new @browser.span :id => "sdc-mainpanel-extraservicesbtn-btnIconEl"
        service_modal = Print::Postage::ExtraServices.new @browser
        5.times do
          button.safe_click
          sleep 1
          return service_modal if service_modal.present?
        end
        stop_test "Unable to open Extra Services Modal, check your code." unless service_modal.present?
      end
    end
  end
end