module Stamps
  module Orders
    #todo-rob updates SettingsModal tests
    class StoresTabView < Browser::StampsModal
      def add
        button = StampsElement.new browser.span(id: "addStoreButton-btnIconEl")
        modal = Stores::MarketPlace.new(param)
        label_unavailable = LabelUnavailable.new(param)
        15.times do
          return modal if modal.present?
          return label_unavailable if label_unavailable.present?
          button.click
        end
        Stores::MarketPlace.new(param)
      end

      def edit

      end

      def reconnect

      end

      def delete

      end

      def select store

      end

      def present?
        browser.span(id: "addStoreButton-btnIconEl").present?
      end

      private
      def cache
        @cache ||= {}
      end

    end

    module OrdersSettingsCache
      def cache
        @cache ||= {}
      end
    end

    module OrdersSettingsTabBar
      include OrdersSettingsCache
      def stores_tab
        20.times do
          stores_element.click
          return stores_tab_view if stores_tab_view.present?
        end
        nil
      end

      def general_settings
      end

      def international_settings

      end

      def label_messages_settings

      end

      private
      def general_element
        (cache[:general_element].nil? || !cache[:general_element].present?)?cache[:general_element] = StampsElement.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(1)")):cache[:general_element]
      end

      def stores_tab_view
        (cache[:stores_tab_view].nil? || !cache[:stores_tab_view].present?)?cache[:stores_tab_view] = StoresTabView.new(param):cache[:stores_tab_view]
      end

      def stores_element
        (cache[:stores_tab].nil? || !cache[:stores_tab].present?)?cache[:stores_tab] = StampsElement.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(2)")):cache[:stores_tab]
      end

      def international_element
        (cache[:international_element].nil? || !cache[:international_element].present?)?cache[:international_element] = StampsElement.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(3)")):cache[:international_element]
      end

      def label_messages_element
        (cache[:label_messages_element].nil? || !cache[:label_messages_element].present?)?cache[:label_messages_element] = StampsElement.new(browser.span(css: "[id^=tabbar-][id$=-targetEl] a:nth-child(4)")):cache[:label_messages_element]
      end
    end

    module OrdersSettingsTitle
      include OrdersSettingsCache
      def present?
        window_title.present?
      end

      def window_title
        StampsElement.new(browser.div(css: "[id^=userprefswindow-][id$=userprefswindow-1751_header-targetEl] div div"))
      end

      def x_btn
        browser.img(css: "")
      end
    end


    class OrdersSettings < Browser::StampsModal
      include OrdersSettingsTitle
      include OrdersSettingsTabBar
    end

  end
end