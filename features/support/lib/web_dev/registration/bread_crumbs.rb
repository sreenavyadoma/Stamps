module Stamps
  module Registration
    class RegistrationBreadCrumbs < Browser::StampsModal
      attr_reader :bread_crumb_profile, :bread_crumb_membership, :bread_crumb_choose_supplies

      def initialize(param)
        super
        @bread_crumb_profile = StampsElement.new(browser.span(css: "li[id=breadcrumb_Profile]>span"))
        @bread_crumb_membership = StampsElement.new(browser.span(css: "li[id=breadcrumb_Membership]>span"))
        #@bread_crumb_special_offer = StampsElement.new(browser.span(css: "li[id=breadcrumb_sm_SpecialOffer]>span"))
      end
    end
  end
end



