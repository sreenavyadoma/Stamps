module Stamps
  module Registration
    class RegistrationBreadCrumbs < Browser::StampsModal
      attr_reader :bread_crumb_profile, :bread_crumb_membership, :bread_crumb_choose_supplies

      def initialize(param)
        super
        @bread_crumb_profile = StampsElement.new(browser.li(id: "breadcrumb_Profile"))
        @bread_crumb_membership = StampsElement.new(browser.li(id: "breadcrumb_Membership"))
        @bread_crumb_choose_supplies = StampsElement.new(browser.li(id: "breadcrumb_ChooseSupplies"))
      end
    end
  end
end


