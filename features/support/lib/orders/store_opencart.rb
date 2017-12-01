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