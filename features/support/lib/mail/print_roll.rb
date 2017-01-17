# encoding: utf-8
module Stamps
  module Mail

    class RollFormView < MailForm
      def preview_image
        image = BrowserElement.new browser.img css: "dimg[src*='Labelsample.gif']"
      end

      def hide_postage_value
        checkbox_field = browser.text_field css: "input[id=hidePostageCheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[5]

        Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"
      end

      def print_reference_number
        checkbox_field = browser.text_field css: "input[id=printreferencecheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[6]

        Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"
      end

      def reference_number
        TextboxElement.new browser.text_field name: "referenceNumber"
      end

      def cost_code
        CostCode.new(param)
      end
    end

    class Roll < MailForm
      def insure_for
        DetailsInsureFor.new(param)
      end

      def ship_date
        ShipDate.new(param)
      end

      def form_view
        RollFormView.new(param)
      end
    end
  end
end