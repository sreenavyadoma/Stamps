module Stamps
  module PaymentAdministratorManagerApp
    def pam
      @pam ||= Pam::PaymentAdministratorManager.new(modal_param)
    end
  end
end