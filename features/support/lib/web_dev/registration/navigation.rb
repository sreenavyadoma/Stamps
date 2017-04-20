module Stamps
  module Registration
    module Navigation

    end
  end
end

class RegistrationNavigation < Browser::StampsModal
  attr_reader :stamps_logo, :usps_logo

  def initialize(param)
    super
    @stamps_logo = StampsElement.new(browser.img(id: "sdc-logo"))
    @usps_logo = StampsElement.new(browser.img(css: "img[src*=logo_usps_vendor_white]"))
  end
end
