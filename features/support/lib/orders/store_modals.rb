module Stamps
  module Orders
    class MarketPlaceStoreModals < Stamps::Browser::Base
      def PayPal
        (cache[:PayPal].nil?||!cache[:PayPal].present?)?cache[:PayPal]=Stamps::Orders::Stores::PayPal::Store.new(param):cache[:PayPal]
      end

      def PayPal_store
        cache[:PayPal_store].nil? ? cache[:PayPal_store] = Stamps::Orders::Stores::PayPal::Store.new(param) : cache[:PayPal_store]
      end

      def store_settings
        cache[:store_settings].nil? ? cache[:store_settings] = Stamps::Orders::Stores::StoreSettings.new(param) : cache[:store_settings]
      end

      def rakuten
        cache[:rakuten].nil? ? cache[:rakuten] = Stamps::Orders::Stores::Rakuten.new(param) : cache[:rakuten]
      end

      def shipstation
        cache[:shipstation].nil? ? cache[:shipstation] = Stamps::Orders::Stores::OpenCart.new(param) : cache[:shipstation]
      end

      def square
        cache[:square_store].nil? ? cache[:square_store] = Stamps::Orders::Stores::Square.new(param) : cache[:square_store]
      end

      def add_your_store_modal
        cache[:add_store].nil? ? cache[:add_store] = Stamps::Orders::Stores::Marketplace.new(param) : cache[:add_store]
      end

    end
  end
end
