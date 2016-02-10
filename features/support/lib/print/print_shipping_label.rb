# encoding: utf-8
module Print
  module Postage

    class ShippingLabelFormView < Print::Postage::DomesticCommon
      def hide_postage_value
        checkbox_field = @browser.input :css => "input[id=hidePostageCheckbox]"
        verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[5]

        Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
      end
    end

    class ShippingLabel < Print::Postage::DomesticCommon

      def ship_from
        Print::Postage::ShipFrom.new @browser
      end

      def ship_to
        Print::Postage::ShipTo::ShipToDomestic.new @browser
      end

      def ship_to_international
        Print::Postage::ShipTo::ShipToInternational.new @browser
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
        button = Button.new @browser.span :id => "sdc-mainpanel-extraservicesbtn-btnIconEl"
        service_modal = Print::Postage::ExtraServices.new @browser
        5.times do
          button.safe_click
          sleep 1
          return service_modal if service_modal.present?
        end
        raise "Unable to open Extra Services Modal, check your code." unless service_modal.present?
      end

      def customs
        button = Button.new @browser.span :id => "sdc-mainpanel-editcustombtn-btnIconEl"
        customs_modal = Print::Postage::CustomsForm.new @browser
        5.times do
          button.safe_click
          sleep 1
          return customs_modal if customs_modal.present?
        end
        raise "Unable to open Customs Modal, check your code." unless customs_modal.present?
      end

      def contacts
        Print::Postage::Contacts.new @browser
      end

      def ship_date
        Print::Postage::ShipDate.new @browser
      end

      def form_view
        Print::Postage::ShippingLabelFormView.new @browser
      end

    end
  end
end