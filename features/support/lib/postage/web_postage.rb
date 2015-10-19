module Postage
  class WebPostage < PostageObject
    def visit *args
      @sign_in ||= Postage::SignInPage.new @browser
      @sign_in.visit *args
      self
    end

    def sign_in *args
      @sign_in ||= Postage::SignInPage.new @browser
      @sign_in.sign_in *args
    end

    def navigation
      @navigation ||= Postage::Navigation.new @browser
    end
  end
end