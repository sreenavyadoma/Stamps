module Stamps
  module Orders
    class MarketPlaceStoreModals < Stamps::WebApps::Base
      def paypal
        (cache[:paypal].nil?||!cache[:paypal].present?)?cache[:paypal]=Stamps::Orders::Stores::PayPal::Store.new(param):cache[:paypal]
      end

      def paypal_store
        cache[:paypal_store].nil? ? cache[:paypal_store] = Stamps::Orders::Stores::PayPal::Store.new(param) : cache[:paypal_store]
      end

      def store_settings
        cache[:store_settings].nil? ? cache[:store_settings] = Stamps::Orders::Stores::StoreSettings.new(param) : cache[:store_settings]
      end

      def rakuten
        cache[:rakuten].nil? ? cache[:rakuten] = Stamps::Orders::Stores::Rakuten::Store.new(param) : cache[:rakuten]
      end

      def shipstation
        cache[:shipstation].nil? ? cache[:shipstation] = Stamps::Orders::Stores::OpenCart::Store.new(param) : cache[:shipstation]
      end

      def square
        cache[:square].nil? ? cache[:square] = Stamps::Orders::Stores::Square::Store.new(param) : cache[:square]
      end

      def add_your_store_modal
        cache[:add_store].nil? ? cache[:add_store] = Stamps::Orders::Stores::Marketplace.new(param) : cache[:add_store]
      end
    end
  end
end
