module SdcHistory
  class SdcHistoryToolbar < SdcPage
    page_object(:refund, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Refund"]'} }
    page_object(:create_return_label) { {xpath: '//span[text()="Create Return Label"]'} }
    page_object(:schedule_pickup) { {xpath: '//span[text()="Schedule Pickup"]'} }
    page_object(:create_scan_form) { {xpath: '//span[text()="Create Scan Form"]'} }
    page_object(:cost_codes) { {xpath: '//span[text()="Cost Codes"]'} }
  end

  class SdcHistoryToolbarPickup < SdcPage
    page_object(:all_eligible_packages) { {xpath: '//*[text()="Manage Pickups"]/../../..//*[text()="Selected Packages"]'} }
    page_object(:selected_packages) { {xpath: '//*[text()="Manage Pickups"]/../../..//*[text()="Selected Packages"]'} }
    page_object(:manage_pickups) { {xpath: '//*[text()="Manage Pickups"]'} }
  end

  class SdcHistoryToolbarScanForm < SdcPage
    page_object(:all_eligible_packages) { {xpath: '//*[text()="Reprint Scan Form"]/../../..//*[text()="All Eligible Packages"]'} }
    page_object(:selected_packages) { {xpath: '//*[text()="Reprint Scan Form"]/../../..//*[text()="Selected Packages"]'} }
    page_object(:reprint_scan_form) { {xpath: '//*[text()="Reprint Scan Form"]'} }
  end

  class SdcHistoryToolbarCostCodes < SdcPage
    page_object(:change_cost_code) { {xpath: '//*[text()="Change Cost Code"]'} }
    page_object(:add_edit_cost_codes) { {xpath: '//*[text()="Add/Edit Cost Codes"]'} }
  end

  #all your toolbar modals goes here
end