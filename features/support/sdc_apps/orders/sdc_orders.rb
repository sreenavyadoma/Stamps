module Stamps
  module Orders
    class SdcOrders < SdcPageObject
      def landing_page
        @landing_page ||= if SdcEnv.browser
                            LandingPage.new
                          elsif SdcEnv.i_device_name
                            Mobile::ILandingPage.new
                          else
                            raise "Unable to determine if this is a mobile or browser test."
                          end
      end

      def order_details

      end

      def toolbar

      end
    end
  end
end

