module Stamps
  module Orders
    module Stores
      module ShipStationUpgradeMessage
        def free_upgrade_message
          (cache[:free_upgrade_message].nil?||!cache[:free_upgrade_message].present?)?cache[:free_upgrade_message]= StampsField.new(browser.span(text: "Requires Free Upgrade")):cache[:free_upgrade_message]
        end

        def available_in_shipstation_msg
          (cache[:available_in_shipstation_msg].nil?||!cache[:available_in_shipstation_msg].present?)?cache[:available_in_shipstation_msg]= StampsField.new(browser.div(text: 'Available in ShipStation')):cache[:available_in_shipstation_msg]
        end

        def window_title
          (cache[:window_title].nil?||!cache[:window_title].present?)?cache[:window_title]=StampsField.new(browser.div(text: "Add Advanced Shipping Features!")):cache[:window_title]
        end
      end

      class OpenCart < Browser::StampsModal
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