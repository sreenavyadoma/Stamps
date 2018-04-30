module Stamps
  class SdcHealthCheck < SdcPage
    page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
  end

  class SdcMailLandingPage < SdcPage
    page_url { |env| "https://print#{env}.stamps.com/webpostage/default2.aspx" }
  end

  module SdcWebsite
    extend self
module SdcWebsite

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

end