module SdcHistory

  class SdcHistoryToolbarPickup < SdcPage
    page_object(:link) { {xpath: '//span[text()="Schedule Pickup"]'} }
    page_object(:all_eligible_packages) { {xpath: '//*[text()="Manage Pickups"]/../../..//*[text()="Selected Packages"]'} }
    page_object(:selected_packages) { {xpath: '//*[text()="Manage Pickups"]/../../..//*[text()="Selected Packages"]'} }
    page_object(:manage_pickups) { {xpath: '//*[text()="Manage Pickups"]'} }
  end

  class SdcHistoryToolbarScanForm < SdcPage
    page_object(:link) { {xpath: '//span[text()="Create Scan Form"]'} }
    page_object(:all_eligible_packages) { {xpath: '//*[text()="Reprint Scan Form"]/../../..//*[text()="All Eligible Packages"]'} }
    page_object(:selected_packages) { {xpath: '//*[text()="Reprint Scan Form"]/../../..//*[text()="Selected Packages"]'} }
    page_object(:reprint_scan_form) { {xpath: '//*[text()="Reprint Scan Form"]'} }
  end

  class SdcHistoryToolbarCostCodes < SdcPage
    page_object(:link) { {xpath: '//span[text()="Cost Codes"]'} }
    page_object(:change_cost_code) { {xpath: '//*[text()="Change Cost Code"]'} }
    page_object(:add_edit_cost_codes) { {xpath: '//*[text()="Add/Edit Cost Codes"]'} }
  end

  class SdcHistoryRefund < SdcPage
    page_object(:link, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Refund"]'} }
  end

  class SdcHistoryCreateReturnLabel < SdcPage
    page_object(:link) { {xpath: '//span[text()="Create Return Label"]'} }
  end

  module Toolbar
    class << self
      def refund
        SdcHistoryRefund.new
      end

      def create_return_label
        SdcHistoryCreateReturnLabel.new
      end

      def schedule_pickup
        SdcHistoryToolbarPickup.new
      end

      def create_scan_form
        SdcHistoryToolbarScanForm.new
      end

      def cost_codes
        SdcHistoryToolbarCostCodes.new
      end
    end
  end

end