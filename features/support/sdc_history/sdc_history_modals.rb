module SdcHistory
  module SdcHistoryModals

    class Refund < SdcPage
      page_object(:title) { {xpath: '//*[contains(@class, "x-title-text")][text()="Refund"]'} }
      page_object(:submit) { {xpath: '//*[text()="Submit"]'} }
      page_object(:cancel) { {xpath: '//*[text()="Cancel"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
    end

    class ManagePickups < SdcPage
      page_object(:title) { {xpath: '//*[contains(@class, "x-title-text")][text()="Refund"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:edit_pickup) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:cancel_pickup) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_objects(:rows) { {xpath: '//div[contains(@id, "manage-pickup-window")]//tr'} }
    end

    class SchedulePickup < SdcPage
      page_object(:title) { {xpath: '//*[text()="Schedule Pickup"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:submit) { {xpath: '//*[text()="Submit"]'} }
      page_object(:cancel) { {xpath: '//*[text()="Cancel"]'} }

      page_object(:first_name, tag: textfield) { {xpath: '//*[@name="FirstName"]'} }
      page_object(:last_name, tag: textfield) { {xpath: '//*[@name="LastName"]'} }
      page_object(:company, tag: textfield) { {xpath: '//*[@name="Company"]'} }
      page_object(:address, tag: textfield) { {xpath: '//*[@name="Address"]'} }
      page_object(:city, tag: textfield) { {xpath: '//*[@name="City"]'} }
      page_object(:phone_number, tag: textfield) { {xpath: '//*[@name="PhoneNumber"]'} }
      page_object(:phone_ext, tag: textfield) { {xpath: '//*[@name="PhoneExt"]'} }
      page_object(:express_mail_pieces, tag: textfield) { {xpath: '//*[@name="ExpressMailPieces"]'} }
      page_object(:priority_mail_pieces, tag: textfield) { {xpath: '//*[@name="PriorityMailPieces"]'} }
      page_object(:international_pieces, tag: textfield) { {xpath: '//*[@name="InternationalPieces"]'} }
      page_object(:first_class_pieces, tag: textfield) { {xpath: '//*[@name="FirstClassPieces"]'} }
      page_object(:other_pieces, tag: textfield) { {xpath: '//*[@name="OtherPieces"]'} }
      page_object(:estimated_weight, tag: textfield) { {xpath: '//*[@name="EstimatedWeight"]'} }
      page_object(:special_instructions, tag: textfield) { {xpath: '//*[@name="SpecialInstructions"]'} }

      #todo - state
      #todo - location
    end

    class SchedulePickupConfirm < SdcPage
      page_object(:title) { {xpath: '//*[text()="Schedule Pickup"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:print_scan_form) { {xpath: '//*[text()="Print Scan Form"]'} }
      page_object(:done) { {xpath: '//*[text()="Done"]'} }
    end

    class PickupError < SdcPage
      page_object(:title) { {xpath: '//*[text()="Pickup Error"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:learn_more) { {xpath: '//*[text()="Learn More"]'} }
    end

    class ScanForm < SdcPage
      page_object(:title) { {xpath: '//*[text()="Scan Form"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:print_scan_form) { {xpath: '//*[text()="Print Scan Form"]'} }

      #todo - checkbox for details
    end

    class ReprintScanForm < SdcPage
      page_object(:title) { {xpath: '//*[text()="Reprint Scan Form"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:print_scan_form) { {xpath: '//*[text()="Print Scan Form"]'} }
      page_object(:print_details) { {xpath: '//*[text()="Print Details"]'} }

      #todo - row
    end

    class ScanFormError < SdcPage
      #title, xbtn, close, learn more

    end

    class ChangeCostCode < SdcPage
      #title, xbtn, save, dropdown
      page_object(:title) { {xpath: '//*[text()="Change Cost Code"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:save) { {xpath: '//*[text()="Save"]'} }

      #todo - dropdown
    end

  end
end
