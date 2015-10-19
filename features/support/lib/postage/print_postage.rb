module Postage
  class PrintPostage < PostageObject

    def sign_in_page
      @sign_in ||= Postage::SignInPage.new @browser
    end

    def navigation
      @navigation ||= Postage::Navigation.new @browser
    end
  end
end