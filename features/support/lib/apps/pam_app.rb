module Stamps
  module PaymentAdministratorManagerApp
    def pam
      @pam ||= Pam::PaymentAdministratorManager.new(SdcTest.web_apps_param)
    end
  end
end