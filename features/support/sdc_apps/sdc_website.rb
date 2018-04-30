


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