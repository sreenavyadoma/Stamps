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

      module GeneralSettings
        def text
          (cache[:text].nil?||!cache[:text].present?)?cache[:text]= StampsField.new(browser.h3(text: "General Settings")):cache[:text]
        end

        def store_nickname
          (cache[:store_nickname].nil?||!cache[:store_nickname].present?)?cache[:store_nickname]=StampsTextbox.new(iframe.text_field(id: "storeName")):cache[:store_nickname]
        end

        def checkbox
          input=iframe.input(css: 'input[id=importOrders]')
          verify=iframe.input(css: 'input[id=importOrders]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end
      end

      module ServiceMapping

        def text
          (cache[:text].nil?||!cache[:text].present?)?cache[:text]= StampsField.new(browser.h3(text: "Service Mapping")):cache[:text]
        end

        def requested_service
          (cache[:requested_service].nil?||!cache[:requested_service].present?)?cache[:requested_service]= StampsTextbox.new(iframe.text_field(css: "div[id^='serviceName-'][name='serviceName']]")) :cache[:requested_service]
        end

        def shipping_serv_dropdown
          (cache[:shipping_serv_dropdown].nil?||!cache[:shipping_serv_dropdown].present?)?cache[:shipping_serv_dropdown]=StampsField.new(
              browser.div(css: "div>input[placeholder='Select a Service']")):cache[:shipping_serv_dropdown]
        end

        def shipping_serv_textbox
          (cache[:shipping_serv_textbox].nil?||!cache[:shipping_serv_textbox].present?)?cache[:shipping_serv_textbox]=StampsTextbox.new(iframe.text_field(placeholder: "Select a Service")):cache[:shipping_serv_textbox]
        end

        def select_servicess(str)
          service_selection = StampsField.new(browser.span(text: str))

          15.times do
            break if shipping_serv_textbox.text.include?(str)
            shipping_serv_dropdown.click unless service_selection.present?
            shipping_serv_dropdown.wait_until_present(4)
            shipping_serv_dropdown.click unless service_selection.present?
            service_selection.scroll_into_view
            service_selection.click
            blur_out
          end
          shipping_serv_textbox.text
        end

        def action_remove_btn
          (cache[:action_remove_btn].nil?||!cache[:action_remove_btn].present?)?cache[:action_remove_btn]=StampsField.new(iframe.button(css: "[ng-click^='storeEdit.removeServiceMapping']")):cache[:action_remove_btn]
        end
      end

      class Settings < Browser::StampsModal

        def window_title
          StampsField.new browser.div(text: "Settings")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window=window_title
          3.times do
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


      class Square < Browser::StampsModal
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
      end
    end
  end
end