module Stamps
  module Orders
    module OrdersSettings
      module StoresTabViewToolbar
        def add_btn
          (cache[:add_btn].nil?||!cache[:add_btn].present?)?cache[:add_btn]=StampsField.new(browser.span(css: "[id=addStoreButton-btnIconEl]")):cache[:add_btn]
        end

        def edit_btn
          (cache[:edit_btn].nil?||!cache[:edit_btn].present?)?cache[:edit_btn]=StampsField.new(browser.a(css: "[class*=sdc-managestoreswindow-editbtn]")):cache[:edit_btn]
        end

        def marketplace_window_title
          (cache[:marketplace_window_title].nil?||!cache[:marketplace_window_title].present?)?cache[:marketplace_window_title]=Browser::Base.new(
              param).extend(Orders::Stores::MarketPlaceWindowTitle):cache[:marketplace_window_title]
        end

        def store_settings_window_title
          (cache[:store_settings_window_title].nil?||!cache[:store_settings_window_title].present?)?cache[:store_settings_window_title]=Browser::Base.new(
              param).extend(Orders::Stores::StoreSettingsWindowTitle):cache[:store_settings_window_title]
        end

        def add
          20.times do
            return marketplace_window_title.window_title.text if marketplace_window_title.window_title.present?
            add_btn.click
          end
          nil
        end

        def edit
          20.times do
            return store_settings_window_title.window_title.text if store_settings_window_title.window_title.present?
            edit_btn.click
            sleep(2)
          end
          nil
        end

        def reconnect

        end

        def delete

        end
      end


      module StoresTabViewBottom
      end

      class StoresTabView < Browser::Base
        include StoresTabViewToolbar
        include StoresTabViewBottom

        def present?
          add_btn.present?
        end

        def select_store(store)
          field=StampsField.new(browser.div(text: store))
          20.times do
            field.click
            return field.text if field.field.parent.parent.parent.parent.attribute_value('class').include?('selected')
          end
          nil
        end
      end

    end
  end
end