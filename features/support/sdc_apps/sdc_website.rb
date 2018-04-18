module Stamps

  module SdcWebsite
    extend self

    def landing_page
      @landing_page ||= SdcOrdersLandingPage.new
    end

    def orders
      SdcOrders
    end

    def mail
      raise 'Not Implemented'
    end

    def navigation
      SdcNavigation
    end

  end

end
