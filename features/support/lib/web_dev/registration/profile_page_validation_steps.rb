module Stamps
  module Registration
    module Profile_Page

      class ProfileFooter < Browser::StampsModal
        attr_reader :email, :username, :password, :retype_password, :usage_type, :promo_code, :profile_content_createanaccount, :profile_content_money_saving_offers, :profile_moneysavingoffers_checkbox, :profile_continue_button, :profile_header
        def initialize(param)
          super(param)
          #@profile_header = StampsElement.new ( browser.h1)
          @email = StampsElement.new(browser.text_field(id: "email"))
          @username = StampsElement.new( browser.text_field(id: "username"))
          @password = StampsElement.new( browser.text_field(id: "password")).set ('stamps123')
          @retype_password = StampsElement.new(browser.text_field (id: "confirmPassword")).set ('stamps1234')
          @usage_type = StampsElement.new (browser.select_list (id: "usageType")).select ("Individual/Home Office")
          @promo_code = StampsElement.new (id: "promoCode")
          @profile_moneysavingoffers_checkbox = StampsElement.new (browser.checkbox(id: 'optIn').set?).to be_truthy
          @profile_continue_button = StampsElement.new (browser.button(id: "next")).present?).to be_truthy


         # @profile_content_createanaccount = expect StampsElement.new(browser.text) to include (str)
         # @profile_content_money_saving_offers = expect StampsElement.new(browser.text) to include (str)
         #


        end

      end

    end
  end
end




