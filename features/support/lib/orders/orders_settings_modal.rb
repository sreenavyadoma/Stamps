module Stamps
  module Orders
    module OrdersSettings
      module OrdersSettingsCache
        def cache
          @cache ||= {}
        end
      end

      module StoresTabViewToolbar
        include OrdersSettingsCache

        def add_btn
          (cache[:add_btn].nil?||!cache[:add_btn].present?)?cache[:add_btn]=StampsElement.new(browser.span(css: "[id=addStoreButton-btnIconEl]")):cache[:add_btn]
        end

        def market_place_window
          (cache[:market_place_window].nil?||!cache[:market_place_window].present?)?cache[:market_place_window]=Browser::StampsModal.new(param).extend(Orders::Stores::MarketPlaceTitle):cache[:market_place_window]
        end

        def add
          20.times do
            return market_place_window.window_title.text if market_place_window.window_title.present?
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
        include OrdersSettingsCache

      end

      module StoresTabViewBottom
        include OrdersSettingsCache

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
        include OrdersSettingsCache

        def stores_tab_view
          (cache[:stores_tab_view].nil? || !cache[:stores_tab_view].present?)?cache[:stores_tab_view]=Orders::OrdersSettings::StoresTabView.new(param):cache[:stores_tab_view]
        end

        def stores_tab
          20.times do
            return stores_tab_view if stores_tab_view.add_btn.present?
            stores_tab_btn.click
          end
          nil
        end

        def general_settings
        end

        def international_settings
        end

        def label_messages_settings
        end

        def general_element
          (cache[:general_element].nil? || !cache[:general_element].present?)?cache[:general_element]=StampsElement.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(1)")):cache[:general_element]
        end

        def stores_tab_btn
          (cache[:stores_tab_btn].nil? || !cache[:stores_tab_btn].present?)?cache[:stores_tab_btn]=StampsElement.new(browser.span(text: "Stores")):cache[:stores_tab_btn]
        end

        def international_element
          (cache[:international_element].nil? || !cache[:international_element].present?)?cache[:international_element]=StampsElement.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(3)")):cache[:international_element]
        end

        def label_messages_element
          (cache[:label_messages_element].nil? || !cache[:label_messages_element].present?)?cache[:label_messages_element]=StampsElement.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(4)")):cache[:label_messages_element]
        end
      end

      module OrdersSettingsTitle
        include OrdersSettingsCache
        def window_title
          (cache[:window_title].nil?)?cache[:window_title]=StampsElement.new(browser.div(css: "[id=userprefswindow_header-targetEl] div div")):cache[:window_title]
        end

        def x_btn
          (cache[:window_title].nil?)?cache[:window_title]=StampsElement.new(browser.img(css: "[id$=userprefswindow-1751_header-targetEl] img")):cache[:window_title]
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