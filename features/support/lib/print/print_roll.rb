# encoding: utf-8
module Stamps
  module Print
    module Postage

      class RollFormView < Print::Postage::PrintPostageObject

        def preview_image
          image = BrowserElement.new browser.img css: "dimg[src*='Labelsample.gif']"
        end

        def hide_postage_value
          checkbox_field = browser.input css: "input[id=hidePostageCheckbox]"
          verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
          verify_field = verify_fields[5]

          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def print_reference_number
          checkbox_field = browser.input css: "input[id=printreferencecheckbox]"
          verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
          verify_field = verify_fields[6]

          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def reference_number
          BrowserTextBox.new browser.text_field name: "referenceNumber"
        end

        def cost_code
          Print::Postage::CostCode.new param
        end
      end

      class Roll < Print::Postage::PrintPostageObject

        #TODO fix me!!!!
        def insure_for
          Print::Postage::InsureFor.new param
        end

        def ship_date
          Print::Postage::ShipDate.new param
        end

        def form_view
          Print::Postage::RollFormView.new param
        end
      end
    end
  end
end