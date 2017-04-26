module Stamps
  module RegistrationApp
    def registration
      @registration ||= Stamps::Registration::WebRegistration.new(param)
    end

    def registration=registration
      @registration ||= registration
    end

    def sdc_website
      @sdc_website ||= Stamps::Registration::SdcWebsite.new(param)
    end

    def pam
      @pam ||= Pam::PaymentAdministratorManager.new(param)
    end
  end
end