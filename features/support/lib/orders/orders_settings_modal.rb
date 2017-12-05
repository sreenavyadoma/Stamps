module Stamps
  module Orders
    module OrdersSettings
      module StoresTabViewToolbar
        def add_btn
          (cache[:add_btn].nil?||!cache[:add_btn].present?)?cache[:add_btn]=StampsField.new(browser.span(css: "[id=addStoreButton-btnIconEl]")):cache[:add_btn]
        end

        def market_place_window_title
          (cache[:market_place_window_title].nil?||!cache[:market_place_window_title].present?)?cache[:market_place_window_title]=Browser::StampsModal.new(param).extend(Orders::Stores::MarketPlaceWindowTitle):cache[:market_place_window_title]
        end

        def add
          20.times do
            return market_place_window_title.window_title.text if market_place_window_title.window_title.present?
            add_btn.click
          end
          nil
        end

        def edit

        end

        def reconnect

        end

        def delete

        end
      end

      module StoresTabViewGrid
      end

      module StoresTabViewBottom
      end

      class StoresTabView < Browser::StampsModal
        include StoresTabViewToolbar
        include StoresTabViewGrid
        include StoresTabViewBottom

        def present?
          add_btn.present?
        end
      end

      #fix me
      module OrdersSettingsTabBar
        def stores_tab_view
          (cache[:stores_tab_view].nil?||!cache[:stores_tab_view].present?)?cache[:stores_tab_view]=Orders::OrdersSettings::StoresTabView.new(param):cache[:stores_tab_view]
        end

        def stores_tab
          20.times do
            return stores_tab_view if stores_tab_view.add_btn.present?
            stores_tab_btn.click
          end
          nil
        end

        def general_tab
          20.times do
            return general_field if general_field.title.present?
            general_field.click
          end
          nil
        end


        def general_settings
        end

        def international_settings
        end

        def label_messages_settings
        end

        def general_field
          (cache[:general_field].nil?||!cache[:general_field].present?)?cache[:general_field]=StampsField.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(1)")):cache[:general_field]
        end

        def stores_tab_btn
          (cache[:stores_tab_btn].nil?||!cache[:stores_tab_btn].present?)?cache[:stores_tab_btn]=StampsField.new(browser.span(text: "Stores")):cache[:stores_tab_btn]
        end

        def international_field
          (cache[:international_field].nil?||!cache[:international_field].present?)?cache[:international_field]=StampsField.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(3)")):cache[:international_field]
        end

        def label_messages_field
          (cache[:label_messages_field].nil?||!cache[:label_messages_field].present?)?cache[:label_messages_field]=StampsField.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(4)")):cache[:label_messages_field]
        end
      end

      module OrdersSettingsTitle
        def window_title
          (cache[:window_title].nil?)?cache[:window_title]=StampsField.new(browser.div(css: "[id=userprefswindow_header-targetEl] div div")):cache[:window_title]
        end

        def x_btn
          (cache[:window_title].nil?)?cache[:window_title]=StampsField.new(browser.img(css: "[id$=userprefswindow-1751_header-targetEl] img")):cache[:window_title]
        end
      end

      class OrdersSettingsModal < Browser::StampsModal
        include OrdersSettingsTitle
        include OrdersSettingsTabBar

        def present?
          window_title.present?
        end
      end
    end
  end
end