module Stamps
  module Orders
    module Stores
      module OpenCartCache
        def cache
          @cache ||= {}
        end
      end

      module ConnectYourOpenCartStore
        def add_advanced_shipping_feature
          AddAdvancedShippingFeatures.new(param) #ShipstationMarketplace
        end

        def activate_your_new_features
          ActivateYourNewFeatures.new(param) #ShipstationMarketplace
        end
      end
    end
  end
end