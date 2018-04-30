module Stamps
  module Mail
    module PrintPreviewPanel
      module PrintFormBlurOut
        def blur_out_field
          cache[:blur_out_field].nil? || !cache[:blur_out_field].present? ? cache[:blur_out_field] = StampsField.new(driver.label(text: 'Print On:')) : cache[:blur_out_field]
        end

        def blur_out(count = 2)
          expect(blur_out_field).to be_present, 'Blur out field is not present.'
          count.to_i.times do
            blur_out_field.double_click
            blur_out_field.click
          end
        end
      end

      module StampsPrintPreview
        def buy_more_labels
          cache[:buy_more_labels].nil? || !cache[:buy_more_labels].present? ? cache[:buy_more_labels] = PrintPreview.new(param) : cache[:buy_more_labels]
        end

        def lable_preview
          cache[:left_image_preview].nil? || !cache[:left_image_preview].present? ? cache[:left_image_preview] = PrintPreview.new(param) : cache[:left_image_preview]
        end

        def right_image_preview
          cache[:right_image_preview].nil? || !cache[:right_image_preview].present? ? cache[:right_image_preview] = PrintPreview.new(param) : cache[:right_image_preview]
        end
      end
    end
  end
end

