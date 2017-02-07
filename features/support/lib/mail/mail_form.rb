# encoding: utf-8
module Stamps
  module Mail

    class PrintPostageCustoms < Browser::Modal
      def edit_form
        button = StampsElement.new browser.span id: "sdc-mainpanel-editcustombtn-btnIconEl"
        customs_modal = CustomsForm.new(param)
        15.times do
          button.safe_click
          sleep(0.35)
          return customs_modal if customs_modal.present?
        end
        "Unable to open Customs Modal, check your test".should eql 'Edit Customs Modal failed.'
      end

      def restrictions

      end

      def i_agree_to_insurance_terms
        #return a StampsCheckbox object.
      end
    end

    class MailForm < Browser::Modal
      attr_reader :service, :email_tracking, :tracking, :weight, :ship_from, :ship_to, :customs, :extra_services

      def initialize(param)
        super(param)
        @service = MailServiceDropList.new(param)
        @email_tracking = Email.new(param)
        @tracking = Tracking.new(param)
        @weight = Weight.new(param)
        @ship_from = MailShipFrom.new(param)
        @ship_to = Stamps::Mail::ShipTo.new(param)
        @customs = PrintPostageCustoms.new(param)
        @extra_services = StampsElement.new browser.span id: "sdc-mainpanel-extraservicesbtn-btnIconEl"
      end

      def open_extra_services
        service_modal = ExtraServices.new(param)
        10.times do
          extra_services.safe_click
          extra_services.wait_until_present 2
          return service_modal if service_modal.present?
        end
        'Extra Services Modal is present.'.should eql 'Extra Services modal failed to open.' unless service_modal.present?
      end
    end
  end
end