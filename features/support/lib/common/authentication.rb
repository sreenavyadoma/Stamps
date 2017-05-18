module Stamps
  class StampsSignInBase < Browser::StampsModal
    attr_accessor :signed_in_user, :usr, :pw

    def initialize(param)
      super
      @signed_in_user = StampsElement.new(browser.span(id: "userNameText"))
    end
  end
end
