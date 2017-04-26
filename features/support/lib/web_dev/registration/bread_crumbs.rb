module Stamps
  module Registration
    class RegistrationBreadCrumbs < Browser::StampsModal
      attr_reader :breadcrumb_profile, :breadcrumb_membership, :breadcrumb_choose_supplies

      def initialize(param)
        super
        @breadcrumb_profile = StampsElement.new(browser.li(id: "breadcrumb_Profile"))
        @breadcrumb_membership = StampsElement.new(browser.li(id: "breadcrumb_Membership"))
        @breadcrumb_choose_supplies = StampsElement.new(browser.li(id: "breadcrumb_ChooseSupplies"))
      end
    end
  end
end


module Stamps
  module Registration
    class RegistrationBreadCrumbs < Browser::StampsModal
      attr_reader :breadcrumb_profile, :breadcrumb_membership, :breadcrumb_choose_supplies

      def initialize(param)
        super
        @breadcrumb_profile = StampsElement.new(browser.li(id: "breadcrumb_Profile"))
        @breadcrumb_membership = StampsElement.new(browser.li(id: "breadcrumb_Membership"))
        @breadcrumb_choose_supplies = StampsElement.new(browser.li(id: "breadcrumb_ChooseSupplies"))
      end
    end
  end
end

