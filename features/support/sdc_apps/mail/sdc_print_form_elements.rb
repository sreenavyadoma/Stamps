module SdcMail

  class SdcUpgradePlan < SdcPage
    page_object(:window_title) { { xpath: '' } } # @window_title = StampsField.new(driver.div(text: "Upgrade Plan"))
    page_object(:upgrade_now) { { xpath: '' } }
    page_object(:x_btn) { { xpath: '' } }
    page_object(:not_yet) { { xpath: '' } }
    page_object(:paragraph) { { xpath: '' } }
  end

  class SdcManagePrintOptionsModal < SdcPage
    page_object(:search) { { xpath: '' } }
    page_object(:save) { { xpath: '' } }
    page_object(:close) { { xpath: '' } }
    page_object(:search_field) { { xpath: '' } }
    page_object(:search_results) { { xpath: '' } }

    page_object(:chooser) { { xpath: '' } }
    page_object(:verify) { { xpath: '' } }
    chooser(:result_checkbox, :chooser, :verify,'class', 'selected' )
  end

  class SdcPrintOn < SdcPage
    sdc_accessor :print_media

    page_object(:drop_down) { { xpath: '//*[starts-with(@id, "printmediadroplist-")][contains(@id, "-trigger-picker")]' } }
    page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="PrintMedia"]' } }
    page_objects(:selection_list) { { xpath: '//li[contains(@class, "x-boundlist-item")]' } }
    page_object(:label) { { xpath: '//label[(text()="Print On:")]' } }

    def selection(name, str)
      self.class.print_media = SdcPrintMediaHelper.to_sym(str)
      page_object(name) { { xpath: "//li[text()='#{str}']" } }
    end
  end

  module SdcPrintFormMailFrom
    class MailFrom < SdcPage
      page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-shipfromdroplist-trigger-picker"]' } }
      page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="ShipFrom"]' } }

      def selection(name, str)
        page_object(name) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    def mail_from
      MailFrom.new
    end
  end

  module SdcPrintFormMailTo
    class MailTo < SdcPage
      # Mail To Drop down
      page_object(:dom_drop_down) { { xpath: '//*[@id="sdc-mainpanel-matltocountrydroplist-trigger-picker"]' } }
      page_object(:int_drop_down) { {xpath: '//*[@id="shiptoview-international-targetEl"]//div[contains(@id, "-trigger-picker")][starts-with(@id, "combo")]'} }
      page_objects(:dom_text_field, index: 0, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
      page_objects(:int_text_field, index: 1, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
      # Mail To link
      page_object(:link, tag: :u) { { xpath: '//label[contains(@class, "sdc-mainpanel-shiptolinkbtn")]//u' } }
      # Domestic Address
      page_object(:text_area, tag: :textarea) { { xpath: '//textarea[@name="freeFormAddress"]' } }
      # International Address
      page_object(:name, tag: :text_field) { { xpath: '//input[@name="ShipName"]' } }
      page_object(:company, tag: :text_field) { { xpath: '//input[@name="ShipCompany"]' } }
      page_object(:address_1, tag: :text_field) { { xpath: '//input[@name="ShipStreet1"]' } }
      page_object(:address_2, tag: :text_field) { { xpath: '//input[@name="ShipStreet2"]' } }
      page_object(:city, tag: :text_field) { { xpath: '//input[@name="ShipCity"]' } }
      page_object(:province, tag: :text_field) { { xpath: '//input[@name="ShipState"]' } }
      page_object(:postal_code, tag: :text_field) { { xpath: '//input[@name="ShipPostalCode"]' } }
      page_object(:phone, tag: :text_field) { { xpath: '//input[@name="ShipPhone"]' } }

      def selection(name, str)
        page_object(name) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    def mail_to
      MailTo.new
    end
  end

  module SdcPrintFormEmailTracking
    class SdceMailTracking < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-emailtextfield-webpostage-inputEl"]' } }
      page_object(:chooser) { { xpath: 'xxxxxxx' } }
      page_object(:verify) { { xpath: 'xxxxxxx' } }
      chooser(:checkbox, :chooser, :verify, 'class', 'checked')
    end

    def email_tracking
      SdceMailTracking.new
    end
  end
end
