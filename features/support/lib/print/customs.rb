module Print
  module Customs
    class CustomsInformation < PrintObject
      class PackageContents < PrintObject
        def text_box

        end

        def drop_down

        end

        def set value

        end
      end

      class ItemGrid < PrintObject

      end

      def more_info
        Textbox.new @browser.div :css => ""
      end

      def license_no

      end

      def item_grid
        ItemGrid.new @browser
      end

      def save

      end

      def i_agree true_or_false_var

      end

      def total_weight

      end

      def total_lbs

      end

      def total_oz

      end

      def total_value

      end

    end
  end
end