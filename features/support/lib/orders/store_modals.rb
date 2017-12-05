module Stamps
  module Orders
    module MarketPlaceStoreModals
      def paypal_store
        (cache[:paypal_store].nil?||!cache[:paypal_store].present?)?cache[:paypal_store]=Stamps::Orders::Stores::PayPal.new(param):cache[:paypal_store]
      end

      def rakuten
        (cache[:rakuten].nil?||!cache[:rakuten].present?)?cache[:rakuten]=Stamps::Orders::Stores::Rakuten.new(param):cache[:rakuten]
      end

      def shipstation
        (cache[:shipstation].nil?||!cache[:shipstation].present?)?cache[:shipstation]=Stamps::Orders::Stores::OpenCart.new(param):cache[:shipstation]
      end
    end

  end
end
