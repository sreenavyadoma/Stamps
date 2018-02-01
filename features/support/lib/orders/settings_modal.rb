module Stamps
  module Orders
    module OrdersSettings
      module OrdersSettingsTabBar
        def stores_tab
          20.times do
            return stores_tab_view if stores_tab_view.add_btn.present?
            stores_tab_field.click
          end
          nil
        end

        def general_tab
          20.times do
            return general_tab_view if general_tab_view.add_btn.present?
            gen_tab_field.click
          end
          nil
        end

        def international_tab
          20.times do
            return int_tab_view if int_tab_view.add_btn.present?
            int_tab_field.click
          end
          nil
        end

        def label_messages_tab
          20.times do
            return label_tab_view if label_tab_view.add_btn.present?
            label_tab_field.click
          end
          nil
        end

        private
        # Views
        def stores_tab_view
          cache[:stores_tab_view].nil? || !cache[:stores_tab_view].present? ? cache[:stores_tab_view] = Orders::OrdersSettings::StoresTabView.new(param) : cache[:stores_tab_view]
        end

        def general_tab_view
          cache[:general_tab].nil? || !cache[:general_tab].present? ? cache[:general_tab] = Orders::OrdersSettings::GeneralTabView.new(param) : cache[:general_tab]
        end

        def int_tab_view
          cache[:int_tab_view].nil? || !cache[:int_tab_view].present? ? cache[:int_tab_view] = Orders::OrdersSettings::InternationalTabView.new(param) : cache[:int_tab_view]
        end

        def label_tab_view
          cache[:label_tab_view].nil? || !cache[:label_tab_view].present? ? cache[:label_tab_view] = Orders::OrdersSettings::LabelMessagesTabView.new(param) : cache[:label_tab_view]
        end

        # HTML fields
        def stores_tab_field
          cache[:stores_tab_field].nil? || !cache[:stores_tab_field].present? ? cache[:stores_tab_field] = StampsField.new(browser.span(text: 'Stores')) : cache[:stores_tab_field]
        end

        def gen_tab_field
          cache[:gen_tab_field].nil? || !cache[:gen_tab_field].present? ? cache[:gen_tab_field] = StampsField.new(browser.span(text: 'General')) : cache[:gen_tab_field]
        end

        def int_tab_field
          cache[:int_tab_field].nil? || !cache[:int_tab_field].present? ? cache[:int_tab_field] = StampsField.new(browser.span(text: 'International')) : cache[:int_tab_field]
        end

        def label_tab_field
          cache[:label_tab_field].nil? || !cache[:label_tab_field].present? ? cache[:label_tab_field] = StampsField.new(browser.span(text: 'Label Messages')) : cache[:label_tab_field]
        end
      end

      module OrdersSettingsModalTitle
        def window_title
          if cache[:window_title].nil? || !cache[:window_title].present?
            cache[:window_title] = StampsField.new(browser.div(css: '[id=userprefswindow_header-targetEl] div div'))
          end
          cache[:window_title]
        end

        def x_btn
          if cache[:window_title].nil? || !cache[:window_title].present?
              cache[:window_title] = StampsField.new(browser.img(css: '[id$=userprefswindow-1751_header-targetEl] img'))
          end
          cache[:window_title]
        end
      end

      class OrdersSettingsModal < Browser::BaseCache
        include OrdersSettingsModalTitle
        include OrdersSettingsTabBar

        #assign({})

        def present?
          window_title.present?
        end
      end
    end
  end
end