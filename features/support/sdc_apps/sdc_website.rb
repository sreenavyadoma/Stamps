module Stamps

  module SdcWebsite
    extend self

    def landing_page
      @landing_page ||= Object.const_get('Orders::LandingPage').new
    end

    def orders
      @orders ||= Object.const_get('Orders::SdcOrders').new
    end

    def mail
      raise 'Not Implemented'
    end

    def navigation
      @navigation ||= Object.const_get('SdcNavigation').new
    end

  end

end
