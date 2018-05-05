# encoding: utf-8
module Stamps
  module Mail
=begin

    class StartingLabel < Browser::StampsHtmlField
      def label_divs
        driver.divs css: "div[class*='unprintedLabel']"
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
            field_helper.click left_label
            return true if label_selected? left_label
          rescue
            # ignore
          end
        }
        false
      end

      def right
        10.times{
          begin
            field_helper.click right_label
            return true if label_selected? right_label
          rescue
            # ignore
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
          selected=(div.attribute_value 'class').include? 'selectedLabel'
          log.info "Label selected?  #{(selected)? 'Yes':'No'}"
          break if selected
        }
        (div.attribute_value 'class').include? 'selectedLabel'
      end

      def default_selected?
        label_selected? left_label
      end
    end

    class ShippingLabelPrintView < PrintForm
      attr_reader :reference_number

      def initialize(param)
        super
        @reference_number=StampsTextBox.new driver.text_field(name: "referenceNumber")

      end

      def preview_image
        image=StampsElement.new driver.div css: "div[style*='Label_selection_and_view.gif']"
      end

      def hide_postage_value
        checkbox_field=driver.input(id: "hidePostageCheckBox")
        verify_field=checkbox_field.parent.parent.parent.parent
        Stamps::Browser::StampsCheckBox.new checkbox_field, verify_field, 'class', 'checked'
      end

      def print_receipt
        checkbox_field=driver.input(id: "printreceiptcheckbox")
        verify_field=checkbox_field.parent.parent.parent.parent
        Stamps::Browser::StampsCheckBox.new checkbox_field, verify_field, 'class', 'checked'
      end

      def print_reference_number
        checkbox_field=driver.input(id: "printreferencecheckbox")
        verify_field=checkbox_field.parent.parent.parent.parent
        Stamps::Browser::StampsCheckBox.new checkbox_field, verify_field, 'class', 'checked'
      end

      def cost_code
        CostCode.new(param)
      end

      def starting_label
        StartingLabel.new(param)
      end
    end

    class ShippingLabels < PrintForm

      def insure_for
        DetailsInsureFor.new(param)
      end

      def ship_date
        ShipDate.new(param)
      end

      def form_view
        ShippingLabelPrintView.new(param)
      end

    end

=end
  end
end