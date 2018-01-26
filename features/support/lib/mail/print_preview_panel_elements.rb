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

      class PrintPreview < Browser::BaseCache
        include PrintFormBlurOut
        assign({})

        def link
          (cache[:buy_more_labels].nil?||!cache[:buy_more_labels].present?)?cache[:buy_more_labels]=StampsField.new(browser.span(text: "Buy More Labels")):cache[:buy_more_labels]
        end

        def left_label
          (cache[:left_label].nil?||!cache[:left_label].present?)?cache[:left_label]=StampsField.new(browser.div(css: "div[class*=label-chooser-container-border]:nth-child(2)>div>div>div:nth-child(1)")):cache[:left_label]
        end

        def right_label
          (cache[:right_label].nil?||!cache[:right_label].present?)?cache[:right_label]=StampsField.new(browser.div(css: "div[class*=label-chooser-container-border]:nth-child(2)>div>div>div:nth-child(2)")):cache[:right_label]
        end

        def select_left_label
          10.times do
            begin
              left_label.click
              break if (left_label.attribute_value "class").include? 'selected'
            rescue
              false
            end
          end
          (left_label.attribute_value "class").include? 'selected'
        end

        def select_right_label
          10.times do
            begin
              right_label.click
              break if (right_label.attribute_value "class").include? 'selected'
            rescue
              false
            end
          end
          (right_label.attribute_value "class").include? 'selected'
        end

        def left_selected?
          label_selected?(left_label)
        end

        def right_selected?
          label_selected?(right_label)
        end

        def label_selected?(div)
          8.times do
            selected=(div.attribute_value "class").include? 'selected'
            logger.info "Label selected?  #{(selected)? 'Yes':'No'}"
            break if selected
          end
          (div.attribute_value 'class').include? 'selected'
        end

        def default_selected?
          label_selected?(left_label)
        end
      end
    end
  end
end

