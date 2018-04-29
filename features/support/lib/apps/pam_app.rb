module Stamps
  module PaymentAdministratorManagerApp
    def pam
      @pam ||= Pam::PaymentAdministratorManager.new(SdcTest.legacy_web_apps_param)
    end
  end
end