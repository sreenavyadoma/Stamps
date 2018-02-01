module Stamps
  module Orders
    module Stores
      module ShipStationUpgradeMessage
        def free_upgrade_message
          StampsField.new(browser.span(text: "Requires Free Upgrade"))
        end

        def available_in_shipstation_msg
          StampsField.new(browser.div(text: 'Available in ShipStation'))
        end

        def window_title
          StampsField.new(browser.div(text: "Add Advanced Shipping Features!"))
        end
      end

      class OpenCart < Browser::BaseCache
        #assign({})
        def add_advanced_shipping_feature
          (cache[:advanced_shipping].nil?||!cache[:advanced_shipping].present?)?cache[:advanced_shipping]=AddAdvancedShippingFeatures.new(param):cache[:advanced_shipping]
        end

        def activate_your_new_features
          (cache[:activate_features].nil?||!cache[:activate_features].present?)?cache[:activate_features]=ActivateYourNewFeatures.new(param):cache[:activate_features]
        end

        def looking_for_shipstation
          (cache[:for_shipstation].nil?||!cache[:for_shipstation].present?)?cache[:for_shipstation]=LookingForShipStaion.new(param):cache[:for_shipstation]
        end
      end
    end
  end
end