module Stamps
  module Orders
    module OrdersSettings
      module StoresTabViewToolbar
        def add_btn
          (cache[:add_btn].nil?||!cache[:add_btn].present?)?cache[:add_btn]=StampsField.new(browser.span(css: "[id=addStoreButton-btnIconEl]")):cache[:add_btn]
        end

        def marketplace_window_title
          (cache[:marketplace_window_title].nil?||!cache[:marketplace_window_title].present?)?cache[:marketplace_window_title]=Browser::StampsBase.new(param).extend(Orders::Stores::MarketPlaceWindowTitle):cache[:marketplace_window_title]
        end

        def add
          20.times do
            return marketplace_window_title.window_title.text if marketplace_window_title.window_title.present?
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

      class StoresTabView < Browser::StampsBase
        include StoresTabViewToolbar
        include StoresTabViewGrid
        include StoresTabViewBottom

        def present?
          add_btn.present?
        end
      end

    end
  end
end