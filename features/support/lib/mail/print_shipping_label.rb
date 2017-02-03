# encoding: utf-8
module Stamps
  module Mail

    class StartingLabel < Browser::Modal
      def label_divs
        browser.divs css: "div[class*='unprintedLabel']"
      end

      def left_label
        label_divs[0]
      end

      def right_label
        label_divs[1]
      end

      def left
        10.times{
          begin
            element_helper.safe_click left_label
            return true if label_selected? left_label
          rescue
            #ignore
          end
        }
        false
      end

      def right
        10.times{
          begin
            element_helper.safe_click right_label
            return true if label_selected? right_label
          rescue
            #ignore
          end
        }
        false
      end

      def left_selected?
        label_selected? left_label
      end

      def right_selected?
        label_selected? right_label
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
        label_selected? left_label
      end
    end

    class ShippingLabelFormView < MailForm
      attr_reader :reference_number

      def initialize(param)
        super(param)
        @reference_number = StampsTextbox.new browser.text_field(name: "referenceNumber")

      end

      def preview_image
        image = StampsElement.new browser.div css: "div[style*='Label_selection_and_view.gif']"
      end

      def hide_postage_value
        checkbox_field = browser.input(id: "hidePostageCheckbox")
        verify_field = checkbox_field.parent.parent.parent.parent
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def print_receipt
        checkbox_field = browser.input(id: "printreceiptcheckbox")
        verify_field = checkbox_field.parent.parent.parent.parent
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def print_reference_number
        checkbox_field = browser.input(id: "printreferencecheckbox")
        verify_field = checkbox_field.parent.parent.parent.parent
        Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def cost_code
        CostCode.new(param)
      end

      def starting_label
        StartingLabel.new(param)
      end
    end

    class ShippingLabel < MailForm

      def insure_for
        DetailsInsureFor.new(param)
      end

      def ship_date
        ShipDate.new(param)
      end

      def form_view
        ShippingLabelFormView.new(param)
      end

    end
  end
end