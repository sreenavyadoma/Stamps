# encoding: utf-8

module Stamps
  module Print
    module Postage
      class PrintPostageCustoms < Browser::Modal
        def edit_form
          button = ElementWrapper.new browser.span id: "sdc-mainpanel-editcustombtn-btnIconEl"
          customs_modal = Print::Postage::CustomsForm.new param
          5.times do
            button.safe_click
            sleep 1
            return customs_modal if customs_modal.present?
          end
          stop_test "Unable to open Customs Modal, check your TestHelper." unless customs_modal.present?
        end

        def restrictions

        end

        def i_agree_to_insurance_terms
          #return a StampsCheckbox object.
        end
      end

      class PrintPostageObject < Browser::Modal

        def service
          Print::Postage::Service.new param
        end

        def email_tracking
          Print::Postage::Email.new param
        end

        def tracking
          Print::Postage::Tracking.new param
        end

        def weight
          Print::Postage::Weight.new param
        end

        def ship_from
          Print::Postage::ShipFrom.new param
        end

        def ship_to
          Print::Postage::ShipTo.new param
        end

        def customs
          PrintPostageCustoms.new param
        end

        def extra_services
          ElementWrapper.new browser.span id: "sdc-mainpanel-extraservicesbtn-btnIconEl"
        end

        def open_extra_services
          button = extra_services
          service_modal = Print::Postage::ExtraServices.new param
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
end