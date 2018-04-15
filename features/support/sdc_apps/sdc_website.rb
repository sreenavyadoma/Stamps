module Stamps

  module SdcWebsite
    extend self

    def landing_page
      @landing_page ||= Object.const_get('Orders::LandingPage').new
    end

    def orders
      SdcOrders
    end

    def mail
      raise 'Not Implemented'
      # SdcMail
    end

    def navigation
      SdcNavigation
    end

  end

end
