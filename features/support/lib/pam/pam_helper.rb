module Stamps
  module Pam
    include Stamps
    def pam
      PaymentAdministratorManager.new param
    end
  end
end