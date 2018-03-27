module Stamps
  module Orders
    class SdcOrders < PageObject
      def landing_page
        @landing_page ||= if SdcEnv.browser
                            LandingPage.new
                          elsif SdcEnv.i_device_name
                            Mobile::ILandingPage.new
                          else
                            raise "Unable to determine if this is a mobile or browser test."
                          end
      end
    end
  end
end
