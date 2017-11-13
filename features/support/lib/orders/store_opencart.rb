module Stamps
  module Orders
    module Stores
      module OpenCartCache
        def cache
          @cache ||= {}
        end
      end

      class ConnectYourOpenCartStore < Browser::StampsModal

        def ship_station_upgrade_dialog
          AddAdvancedShippingFeatures.new(param) #ShipstationMarketplace
        end
      end
    end
  end
end