module Stamps

  module SdcWebInstHelper

    def orders_inst
      if SdcEnv.browser
        "Orders::SdcOrders"
      elsif SdcEnv.mobile
        "Mobile::SdcOrders"
      else
        raise ArgumentError, 'Can not determine if mobile or browser test'
      end
    end
  end

  class SdcWebsite
    class << self
      include SdcWebInstHelper
      attr_writer :orders

      def landing_page
        @landing_page ||= Object.const_get('Orders::LandingPage').new
      end

      def orders
        @orders ||= Object.const_get(orders_inst).new
      end

      def mail
        raise "Not Implemented"
      end
    end
  end

end
