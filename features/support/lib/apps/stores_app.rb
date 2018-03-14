module Stamps
  module StoresApp
    def volusion
      @volusion=Stores::VolusionLoginPage.new(SdcTest.web_apps_param)
    end
  end
end