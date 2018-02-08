module Stamps
  module Orders
    class MarketPlaceStoreModals < Stamps::Browser::Base
      #assign({})
      def paypal
        (cache[:paypal].nil?||!cache[:paypal].present?)?cache[:paypal]=Stamps::Orders::Stores::PayPal.new(param):cache[:paypal]

      def paypal_store
        cache[:paypal_store].nil? ? cache[:paypal_store] = Stamps::Orders::Stores::PayPal.new(param) : cache[:paypal_store]
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
