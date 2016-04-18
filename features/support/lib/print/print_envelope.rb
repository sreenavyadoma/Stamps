module Print
  module Postage

    class EnvelopeFormView < Print::Postage::PrintForm

      def preview_image
        image = StampsLabel.new @browser.div :id => "envelopePreview"
      end
      
      def include_return_address
        checkbox_field = @browser.input :css => "input[class*=sdc-previewpanel-returnaddrcheckbox]"
        verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[2]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def include_delivery_address
        checkbox_field = @browser.input :css => "input[class*=sdc-previewpanel-deliveryaddrcheckbox]"
        verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[3]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def include_postage
        checkbox_field = @browser.input :css => "input[class*=sdc-previewpanel-includepostagecheckbox]"
        verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[4]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def reference_number
        StampsTextbox.new @browser.text_field :name => "referenceNumber"
      end

      def cost_code
        Print::Postage::CostCode.new @browser
      end

    end

    class Envelope < Print::Postage::PrintForm

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
        Print::Postage::ExtraServices.new @browser
      end

      def ship_date
        Print::Postage::ShipDate.new @browser
      end

      def form_view
        Print::Postage::EnvelopeFormView.new @browser
      end

    end
  end
end