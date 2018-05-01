module SdcWebsite
  class SdcHealthCheck < SdcPage
    page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
  end

  def landing_page
    @landing_page ||= SdcOrdersLandingPage.new
  end
  module_function :landing_page

  def orders
    SdcOrders
  end
  module_function :orders

  def mail
    SdcMail
  end
  module_function :mail

  def navigation
    SdcNavigation
  end
  module_function :navigation

  def customs_form

  end

end
