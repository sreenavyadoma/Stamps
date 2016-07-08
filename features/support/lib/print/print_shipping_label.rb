# encoding: utf-8
module Stamps
  module Print
    module Postage

      class ShippingLabelFormView < Print::Postage::PrintPostageObject

        def preview_image
          image = BrowserElement.new browser.div css: "div[style*='Label_selection_and_view.gif']"
        end

        def hide_postage_value_checkbox
          browser.text_box css: "input[id=hidePostageCheckbox]"
        end

        def hide_postage_value
          checkbox_field = hide_postage_value_checkbox
          verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
          verify_field = verify_fields[5]

          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def print_receipt_checkbox
          browser.text_box css: "input[id=printreceiptcheckbox]"
        end

        def print_receipt
          checkbox_field = print_receipt_checkbox
          verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
          verify_field = verify_fields[6]

          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def print_reference_number_checkbox
          browser.text_box css: "input[id=printreferencecheckbox]"
        end

        def print_reference_number
          checkbox_field = browser.text_box css: print_reference_number_checkbox
          verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
          verify_field = verify_fields[7]

          Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def reference_number
          BrowserTextBox.new browser.text_field name: "referenceNumber"
        end

        def cost_code
          Print::Postage::CostCode.new param
        end

        def starting_label
          Print::Postage::ShippingLabelFormView::StartingLabel.new param
        end

        class StartingLabel < Browser::Modal
          def label_divs
            browser.divs css: "div[class*='unprintedLabel']"
          end

          def left_label_div
            label_divs[0]
          end

          def right_label_div
            label_divs[1]
          end

          def left
            10.times{
              begin
                browser_helper.safe_click left_label_div
                return true if label_selected? left_label_div
              rescue
                #ignore
              end
            }
            false
          end

          def right
            10.times{
              begin
                browser_helper.safe_click right_label_div
                return true if label_selected? right_label_div
              rescue
                #ignore
              end
            }
            false
          end

          def left_selected?
            label_selected? left_label_div
          end

          def right_selected?
            label_selected? right_label_div
          end

          def label_selected? div
            8.times{
              selected = (div.attribute_value 'class').include? 'selectedLabel'
              logger.info "Label selected?  #{(selected)? 'Yes':'No'}"
              break if selected
            }
            (div.attribute_value 'class').include? 'selectedLabel'
          end

          def default_selected?
            label_selected? left_label_div
          end
        end
      end

      class ShippingLabel < Print::Postage::PrintPostageObject

        def insure_for
          Print::Postage::InsureFor.new param
        end

        def ship_date
          Print::Postage::ShipDate.new param
        end

        def form_view
          Print::Postage::ShippingLabelFormView.new param
        end

      end
    end
  end
end