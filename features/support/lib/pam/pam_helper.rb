module Pam
  include Stamps

  def pam
    PaymentAdministratorManager.new @browser
  end
end