module Stamps
  module Orders
    module Stores
      module Square
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
            window = window_title
            20.times do
              break if window.present?
              sleep(0.35)
            end
          end

          def close
            button = StampsField.new(browser.img(css: "img[src*='data:image/gif']"))
            5.times do
              button.click
              sleep(0.35)
              break unless button.present?
            end
          end

          def save
            cache[:save].nil? || !cache[:save].present? ? cache[:save] = StampsField.new(browser.button(id: "saveSettings")) : cache[:save]
          end
        end

        module WindowTitle
          def window_title
            StampsField.new(browser.divs(css: "[id^=storeiframewindow-][id$=_header-targetEl] [class*=x-title-item]").first)
          end

          def x_btn
            StampsField.new(browser.imgs(css: "[id^=storeiframewindow-][id$=_header-targetEl] img").first)
          end
        end

        class Store < Browser::Base
          include WindowTitle
          def iframe
            browser.iframe(css: "iframe[id=storeiframe]")
          end

          def present?
            window_title.present?
          end

          def store_modal
            if cache[:store_modal].nil? || !cache[:store_modal].present?
              cache[:store_modal] = StampsField.new(browser.div(css: "div[id^='storeiframewindow'][id$='header']"))
            end
            cache[:store_modal]
          end

          def store_icon
            if cache[:store_icon].nil? || !cache[:store_icon].present?
              cache[:store_icon] = StampsField.new(iframe.img(css: "img[src*=squarebanner]"))
            end
            cache[:store_icon]
          end

          def authorize_btn
            if cache[:authorize_btn].nil? || !cache[:authorize_btn].present?
              cache[:authorize_btn] = StampsField.new(iframe.button(css: "[ng-click='square.onAuthorizeClick()']"))
            end
            cache[:authorize_btn]
          end

          def settings
            if cache[:settings].nil? || !cache[:settings].present?
              cache[:settings] = Settings.new(param)
            end
            cache[:settings]
          end
        end
      end
    end
  end
end