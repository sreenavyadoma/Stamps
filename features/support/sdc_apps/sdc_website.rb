module Stamps

  module SdcWebsiteHelper
    def landing_page_po
      if SdcEnv.browser
        case SdcEnv.sdc_app
          when :orders
            'Orders::LandingPage'
          when :mail
            raise "Not implemented!"
          else
            raise ArgumentError, "Undefined App :#{SdcEnv.sdc_app}"
        end
      elsif SdcEnv.mobile
        'Orders::ILandingPage'
      else
        raise ArgumentError, 'Can not determine if this is a browser or mobile test'
      end
    end

    def orders_po
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
      include SdcWebsiteHelper
      attr_writer :orders

      def landing_page
        @landing_page ||= Object.const_get(landing_page_po).new
      end

      def orders
        @orders ||= Object.const_get(orders_po).new
      end

      def mail
        raise "Not Implemented"
      end
    end
  end

end
