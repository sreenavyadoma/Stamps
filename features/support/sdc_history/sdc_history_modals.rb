module SdcHistory
  module SdcHistoryModals

    class << self
      def refund
        Refund.new
      end

      def manage_pickups
        ManagePickups.new
      end

      def schedule_pickup
        SchedulePickup.new
      end

      def schedule_pickup_confirm
        SchedulePickupConfirm.new
      end

      def pickup_error
        PickupError.new
      end

      def scan_form
        ScanForm.new
      end

      def reprint_scan_form
        ReprintScanForm.new
      end

      def change_cost_code
        ChangeCostCode.new
      end
    end

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

      page_object(:first_name, tag: textfield) { {xpath: '//input[@name="FirstName"]'} }
      page_object(:last_name, tag: textfield) { {xpath: '//input[@name="LastName"]'} }
      page_object(:company, tag: textfield) { {xpath: '//input[@name="Company"]'} }
      page_object(:address, tag: textfield) { {xpath: '//input[@name="Address"]'} }
      page_object(:city, tag: textfield) { {xpath: '//input[@name="City"]'} }
      page_object(:phone_number, tag: textfield) { {xpath: '//input[@name="PhoneNumber"]'} }
      page_object(:phone_ext, tag: textfield) { {xpath: '//input[@name="PhoneExt"]'} }
      page_object(:express_mail_pieces, tag: textfield) { {xpath: '//input[@name="ExpressMailPieces"]'} }
      page_object(:priority_mail_pieces, tag: textfield) { {xpath: '//input[@name="PriorityMailPieces"]'} }
      page_object(:international_pieces, tag: textfield) { {xpath: '//input[@name="InternationalPieces"]'} }
      page_object(:first_class_pieces, tag: textfield) { {xpath: '//input[@name="FirstClassPieces"]'} }
      page_object(:other_pieces, tag: textfield) { {xpath: '//input[@name="OtherPieces"]'} }
      page_object(:estimated_weight, tag: textfield) { {xpath: '//input[@name="EstimatedWeight"]'} }
      page_object(:special_instructions, tag: textfield) { {xpath: '//input[@name="SpecialInstructions"]'} }

      page_object(:state_text_field, tag: textfield) { { xpath: '//input[@name="State"]' } }
      page_object(:state_drop_down) { { xpath: '//input[@name="State"]/../../*[contains(@class, "trigger")]' } }

      page_object(:package_location_text_field, tag: textfield) { { xpath: '//input[@name="PackageLocation"]' } }
      page_object(:package_location_drop_down) { { xpath: '//input[@name="PackageLocation"]/../../*[contains(@class, "trigger")]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
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

      page_object(:chooser_elem) { { xpath: '//div[contains(@id, "scan-confirmation")]//input]' } }
      page_object(:verify_elem) { { xpath: '//div[contains(@id, "scan-confirmation")]//div[contains(@class, "checkbox")]' } }
      checkbox(:print_details, :chooser_elem, :verify_elem, 'class', 'checked')
    end

    class ReprintScanForm < SdcPage
      page_object(:title) { {xpath: '//*[text()="Reprint Scan Form"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:close) { {xpath: '//*[text()="Close"]'} }
      page_object(:print_scan_form) { {xpath: '//*[text()="Print Scan Form"]'} }
      page_object(:print_details) { {xpath: '//*[text()="Print Details"]'} }

      def row_select(num)
        page_object(:row) { {xpath: "(//div[contains(@id, 'reprint-scan-form')]//tr)[#{num}]"} }
      end
    end

    class ChangeCostCode < SdcPage
      page_object(:title) { {xpath: '//*[text()="Change Cost Code"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:save) { {xpath: '//*[text()="Save"]'} }

      page_object(:change_cost_code_text_field, tag: textfield) { { xpath: '//div[contains(@id, "changeCostCode")]//input' } }
      page_object(:change_cost_code_drop_down) { { xpath: '//div[contains(@id, "changeCostCode")]//*[contains(@class, "arrow")]' } }

      def selection(str)
        page_object(:selection_obj) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class ScanFormError < SdcPage
      #title, xbtn, close, learn more
    end
  end
end
