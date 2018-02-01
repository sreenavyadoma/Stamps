module Stamps
  module Mail
    module PrintPreviewPanel
      module PrintFormBlurOut
        def blur_out_field
          (cache[:blur_out_field].nil?||!cache[:blur_out_field].present?)?cache[:blur_out_field]=StampsField.new(browser.label(text: 'Print On:')):cache[:blur_out_field]
        end

        def blur_out(count=2)
          expect(blur_out_field).to be_present, "Blur out field is not present."
          count.to_i.times do
            blur_out_field.double_click
            blur_out_field.click
          end
        end
      end

      class PrintPreview < Browser::Base
        include PrintFormBlurOut

        #assign({})

        def link
          (cache[:buy_more_labels].nil?||!cache[:buy_more_labels].present?)?cache[:buy_more_labels]=StampsField.new(browser.span(text: "Buy More Labels")):cache[:buy_more_labels]
        end

        def left_image_preview
          (cache[:left_image_preview].nil?||!cache[:left_image_preview].present?)?cache[:left_image_preview]=StampsField.new(browser.div(css: "div[id^='labelchooser-']>div>div>div>div[class*='label-chooser-image'][class$='-without-barcode']>div")):cache[:left_image_preview]
        end

        def right_image_preview
          (cache[:right_image_preview].nil?||!cache[:right_image_preview].present?)?cache[:right_image_preview]=StampsField.new(browser.div(css: "div[id^='labelchooser-']>div>div>div>div[class*='label-chooser-image'][class$='-receipt']>div")):cache[:right_image_preview]
        end
      end
    end
  end
end

