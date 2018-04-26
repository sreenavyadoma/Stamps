module Stamps

  class SdcMailLandingPage < SdcPage
    page_url { |env| "https://print#{env}.stamps.com/webpostage/default2.aspx" }
  end

  module SdcWebsite
    extend self

    def landing_page
      @landing_page ||= SdcOrdersLandingPage.new
    end

    def orders
      SdcOrders
    end

    def mail
      SdcMail
    end

    def navigation
      SdcNavigation
    end

  end

end
