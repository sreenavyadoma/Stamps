module Stamps
  module Orders
    module Stores

      module SqaureWindowTitle
        def window_title
          (cache[:window_title].nil?||!cache[:window_title].present?)?cache[:window_title]=StampsField.new(browser.divs(css: "[id^=storeiframewindow-][id$=_header-targetEl] [class*=x-title-item]").first):cache[:window_title]
        end

        def x_btn
          (cache[:x_btn].nil?||!cache[:x_btn].present?)?cache[:x_btn]=StampsField.new(browser.imgs(css: "[id^=storeiframewindow-][id$=_header-targetEl] img").first):cache[:x_btn]
        end
      end

      module Products
        def title_text
          (cache[:title_text].nil?||!cache[:title_text].present?)?cache[:title_text]= StampsField.new(iframe.h3(css: "div[class^='products-section']>h3")):cache[:title_text]
        end

        def checkbox
          (cache[:checkbox].nil?||!cache[:checkbox].present?)?cache[:checkbox]=StampsCheckbox.new(
              iframe.input(css: 'input[id=addNewProducts]'),
              iframe.input(css: 'input[id=addNewProducts]'),
              "class",
              "ng-not-empty"):cache[:checkbox]
        end

        def sku
          (cache[:sku].nil?||!cache[:sku].present?)?cache[:sku]=StampsRadio.new(
              browser.span(text: 'SKU'),
              browser.span(text: 'SKU'),
              "class",
              "ng-not-empty"):cache[:sku]
        end

        def product_listing_name
          (cache[:product_listing_name].nil?||!cache[:product_listing_name].present?)?cache[:product_listing_name]=StampsRadio.new(
              browser.span(text: 'Product/Listing Name'),
              browser.span(text: 'Product/Listing Name'),
              "class",
              "ng-not-empty"):cache[:product_listing_name]
        end
      end

      class Settings < Browser::Base

        def iframe
          browser.iframe(css: "iframe[id=storeiframe]")
        end

        def window_title
          StampsField.new browser.div(text: "Settings").wait_until_present
        end

        def present?
          wait_until_present.present?
        end

        def wait_until_present
          window=window_title
          20.times do
            break if window.present?
            sleep(0.35)
          end
        end

        def close
          button=StampsField.new(browser.img(css: "img[src*='data:image/gif']"))
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def save
          (cache[:save].nil?||!cache[:save].present?)?cache[:save]=StampsField.new(browser.button(id: "saveSettings")):cache[:save]
        end
      end

      class Square < Browser::Base
        include SqaureWindowTitle

        def iframe
          browser.iframe(css: "iframe[id=storeiframe]")
        end

        def present?
          window_title.present?
        end

        def store_modal
          (cache[:store_modal].nil?||!cache[:store_modal].present?)?cache[:store_modal]=StampsField.new(browser.div(css: "div[id^='storeiframewindow'][id$='header']")):cache[:store_modal]
        end

        def store_icon
          (cache[:store_icon].nil?||!cache[:store_icon].present?)?cache[:store_icon]=StampsField.new(iframe.img(css: "img[src*=squarebanner]")):cache[:store_icon]
        end

        def authorize_btn
          (cache[:authorize_btn].nil?||!cache[:authorize_btn].present?)?cache[:authorize_btn]=StampsField.new(iframe.button(css: "[ng-click='square.onAuthorizeClick()']")):cache[:authorize_btn]
        end

        def settings
          (cache[:settings].nil?||!cache[:settings].present?)?cache[:settings]=Settings.new(param):cache[:settings]
        end
      end
    end
  end
end