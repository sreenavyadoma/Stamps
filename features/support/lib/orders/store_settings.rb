module Stamps
  module Orders
    module Stores

      module StoreIframe
        def store_iframe
          browser.iframe(css: "[id=storeiframe]")
        end
      end

      module GenSetStoreNickname
        include StoreIframe
        def store_nickname
          (cache[:store_nickname].nil?||!cache[:store_nickname].present?)?cache[:store_nickname]=StampsTextbox.new(iframe.text_field(id: "storeName")):cache[:store_nickname]
        end

        def auto_import_new_orders
          (cache[:auto_import].nil?||!cache[:v].present?)?cache[:auto_import]=Stamps::Browser::StampsCheckbox.new(
              store_iframe.input(id: 'importOrders'), store_iframe.input(id: 'importOrders'), "class", "not_empty"):cache[:auto_import]
        end
      end

      module GenSetServiceMapping
        class GenSetShippingService < Browser::StampsModal
          include StoreIframe

          def textbox
            (cache[:textbox].nil?||!cache[:textbox].present?)?cache[:textbox]=StampsTextbox.new(store_iframe.text_field(css: "[type=search]")):cache[:textbox]
          end

          def dropdown
            (cache[:dropdown].nil?||!cache[:dropdown].present?)?cache[:dropdown]=StampsField.new(store_iframe.div(class: "selectize-input")):cache[:dropdown]
          end

          def selection(str)
          end

          def remove_service
            (cache[:remove_service].nil?||!cache[:remove_service].present?)?cache[:remove_service]=StampsField.new(iframe.button(class: "action remove")):cache[:remove_service]
          end

          def manage_service_options
            (cache[:manage_service].nil?||!cache[:manage_service].present?)?cache[:manage_service]=StampsField.new(iframe.button(class: "action remove")):cache[:manage_service]
          end

          def select_service(str)
            #Version 2. check number of selections, if less than 36, bring them all in.
            #
            # [ng-bind-html^='service.PackageStr']

            #browser.spans(css: "[ng-bind-html^='service.PackageStr']").size
            browser.iframe(css: "[id=storeiframe]").spans(css: "[ng-bind-html^='service.PackageStr']").each {|field| p field.text}
            browser.iframe(css: "[id=storeiframe]").span(css: "[class^=ui-select-match][placeholder='Select a Service'] span[ng-hide*=select]")
            "Package/Thick Envelope".match(/Package\/Thick Envelope/).to_s

            textbox = StampsTextbox.new(browser.iframe(css: "[id=storeiframe]").span(css: "[class^=ui-select-match][placeholder='Select a Service'] span[ng-hide*=select]"))
            dd = StampsField.new(browser.iframe(css: "[id=storeiframe]").div(class: "selectize-input"))
            dd.click
            logger.message "=================================================="
            browser.iframe(css: "[id=storeiframe]").spans(css: "[ng-bind-html^='service.PackageStr']").each do|field|
              field = StampsField.new(field)
              dd.click unless field.present?
              field.scroll_into_view
              field_text = field.text
              sleep(0.1)
              field.click
              textbox_text = textbox.text
              sleep(0.1)
              p "#{textbox_text} == #{field_text}"
            end





            textbox = StampsTextbox.new(browser.iframe(css: "[id=storeiframe]").span(css: "[class^=ui-select-match][placeholder='Select a Service'] span[ng-hide*=select]"))
            dd = StampsField.new(browser.iframe(css: "[id=storeiframe]").div(class: "selectize-input"))
            dd.click
            logger.message "=================================================="
            browser.iframe(css: "[id=storeiframe]").spans(css: "[ng-bind-html^='service.PackageStr']").each do|field|
              field = StampsField.new(field)
              dd.click unless field.present?
              field.scroll_into_view
              field_text = field.text
              sleep(0.1)
              field.click
              textbox_text = textbox.text
              sleep(0.1)
              p "#{textbox_text} -- #{field_text}"
            end






            case(str)
              when /First-Class Mail Large Envelope/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/
              when /xxxx/

              else
                #ignore
            end


            # 0 First-Class Mail Large Envelope/Flat
            # 1 First-Class Mail Package/Thick Envelope
            # 2 Priority Mail Large/Thick Envelope
            # 3 Priority Mail Package
            # 4 Priority Mail Large Package
            # 5 Priority Mail Flat Rate Envelope
            # 6 Priority Mail Padded Flat Rate Envelope
            # 7 Priority Mail Legal Flat Rate Envelope
            # 8 Priority Mail Small Flat Rate Box
            # 9 Priority Mail Medium Flat Rate Box
            # 10 Priority Mail Large Flat Rate Box
            # 11 Priority Mail Regional Rate Box A
            # 12 Priority Mail Regional Rate Box B
            # 13 Priority Mail Express Package
            # 14 Priority Mail Express Flat Rate Envelope
            # 15 Priority Mail Express Padded Flat Rate Envelope
            # 16 Priority Mail Express Legal Flat Rate Envelope
            # 17 Media Mail Package
            # 18 Parcel Select Ground Package
            # 19 Parcel Select Ground Large Package
            # 20 Parcel Select Ground Oversized Package
            # 21 First-Class Mail International Large Envelope/Flat
            # 22 First-Class Mail International Package/Thick Envelope
            # 23 Priority Mail International Package
            # 24 Priority Mail International Flat Rate Envelope
            # 25 Priority Mail International Padded Flat Rate Envelope
            # 26 Priority Mail International Legal Flat Rate Envelope
            # 27 Priority Mail International Small Flat Rate Box
            # 28 Priority Mail International Medium Flat Rate Box
            # 29 Priority Mail International Large Flat Rate Box
            # 30 Priority Mail International Regional Rate Box A
            # 31 Priority Mail International Regional Rate Box B
            # 32 Priority Mail Express International Package
            # 33 Priority Mail Express International Flat Rate Envelope
            # 34 Priority Mail Express International Padded Flat Rate Envelope
            # 35 Priority Mail Express International Legal Flat Rate Envelope









          end

          def service_tooltip(str)
          end
        end

        def requested_service
          (cache[:requested_service].nil?||!cache[:requested_service].present?)?cache[:requested_service]=StampsField.new(iframe.text_field(name: "serviceName")):cache[:requested_service]
        end

        def shipping_service
        end
      end
    end
  end
end