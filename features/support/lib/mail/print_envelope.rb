module Stamps
  module Mail

=begin
    class EnvelopeFormView < PrintForm

      def preview_image
        image = StampsElement.new browser.div id: "envelopePreview"
      end

      def include_return_address
        checkbox_field = browser.text_field css: "input[class*=sdc-previewpanel-returnaddrcheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[2]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def include_delivery_address
        checkbox_field = browser.text_field css: "input[class*=sdc-previewpanel-deliveryaddrcheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[3]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def include_postage
        checkbox_field = browser.text_field css: "input[class*=sdc-previewpanel-includepostagecheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[4]

        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def reference_number
        StampsTextbox.new browser.text_field name: "referenceNumber"
      end

      def cost_code
        CostCode.new(param)
      end

    end

    class Envelopes < PrintForm
      attr_accessor :insure_for, :ship_date, :form_view

      def initialize(param)
        @insure_for = DetailsInsureFor.new(param)
        @ship_date = ShipDate.new(param)
        @form_view = EnvelopeFormView.new(param)
      end
    end
=end
  end
end