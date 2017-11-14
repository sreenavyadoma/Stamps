module Stamps
  module Orders
    module Stores
      module OpenCartCache
        def cache
          @cache ||= {}
        end
      end

      module OpenCartWindowTitle
        def window_title
          (cache[:window_title].nil?||!cache[:window_title].present?)?cache[:window_title]=StampsField.new(browser.div(text: "Add Advanced Shipping Features!")):cache[:window_title]
        end
      end

      class OpenCart < Browser::StampsModal
        include OpenCartWindowTitle
        include OpenCartCache

        def add_advanced_shipping_feature
          AddAdvancedShippingFeatures.new(param)
        end

        def activate_your_new_features
          ActivateYourNewFeatures.new(param)
        end
      end
    end
  end
end