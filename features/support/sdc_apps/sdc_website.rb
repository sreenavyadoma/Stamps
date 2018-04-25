module Stamps
  class SdcHealthCheck < SdcPage
    page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
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
