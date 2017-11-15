module Stamps
  module Orders
    module Stores
      module OpenCartCache
        def cache
          @cache ||= {}
        end
      end

      class OpenCart < Browser::StampsModal
        include OpenCartCache

        def add_advanced_shipping_feature
          AddAdvancedShippingFeatures.new(param)
        end

        def activate_your_new_features
          ActivateYourNewFeatures.new(param)
        end

        def looking_for_shipstation
          LookingForShipStaion.new(param)
        end
      end
    end
  end
end