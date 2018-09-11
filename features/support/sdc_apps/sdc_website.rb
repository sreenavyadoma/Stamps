module SdcWebsite
  class SdcHealthCheck < SdcPage
    page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
  end

  class << self
    def landing_page
      SdcOrdersLandingPage.new
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

    def customs_form
      SdcCustomsForm.new
    end

    def restrictions
      SdcRestrictions.new
    end

    def modals
      SdcModals
    end
  end
end
