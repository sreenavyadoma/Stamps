module Stamps
  module Registration
    class RegistrationBreadCrumbs < Browser::Base

      def bread_crumb_profile
        cache[:bread_crumb_profile] = StampsField.new(browser.span(css: "li[id=breadcrumb_Profile]>span")) if cache[:bread_crumb_profile].nil? || cache[:bread_crumb_profile].present?
        cache[:bread_crumb_profile]
      end

      def bread_crumb_membership
        cache[:bread_crumb_membership] = StampsField.new(browser.span(css: "li[id=breadcrumb_Membership]>span")) if cache[:bread_crumb_membership].nil? || cache[:bread_crumb_membership].present?
        cache[:bread_crumb_membership]
      end


    end
  end
end



