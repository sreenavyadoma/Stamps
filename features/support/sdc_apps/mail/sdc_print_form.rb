module SdcMail

  module SdcPrintFormMailFrom

    class MailFrom < SdcPage
      page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-shipfromdroplist-trigger-picker"]' } }
      page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="ShipFrom"]' } }

      def selection(name, str)
        page_object(name) { { xpath: "#{str}" } }
      end
    end

    def mail_from
      MailFrom.new
    end
  end

  module SdcPrintFormMailTo
    class IntMailToCountry < SdcPage

    end

    class MailTo < SdcPage
      page_object(:text_area, tag: :textarea) { { xpath: '//textarea[@name="freeFormAddress"]' } }
      page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-matltocountrydroplist-trigger-picker"]' } }
      page_objects(:dom_text_field, index: 1, tag: :text_field) { { xpath: '//input[@name="ShipCountryCode"]' } }
      page_objects(:int_text_field, index: 2, tag: :text_field) { { xpath: '//input[@name="ShipCountryCode"]' } }
      page_object(:link, tag: u) { { xpath: '//label[contains(@class, "sdc-mainpanel-shiptolinkbtn")]//u' } }
      page_object(:name, tag: :text_field) { { xpath: '//input[@name="ShipName"]' } }
      page_object(:company, tag: :text_field) { { xpath: '//input[@name="ShipCompany"]' } }
      page_object(:address_1, tag: :text_field) { { xpath: '//input[@name="ShipStreet1"]' } }
      page_object(:address_2, tag: :text_field) { { xpath: '//input[@name="ShipStreet2"]' } }
      page_object(:city, tag: :text_field) { { xpath: '//input[@name="ShipCity"]' } }
      page_object(:province, tag: :text_field) { { xpath: '//input[@name="ShipState"]' } }
      page_object(:postal_code, tag: :text_field) { { xpath: '//input[@name="ShipPostalCode"]' } }
      page_object(:phone, tag: :text_field) { { xpath: '//input[@name="ShipPhone"]' } }

      def selection(name, str)
        page_object(name) { { xpath: "#{str}" } }
      end
    end

    def mail_to
      MailTo.new
    end
  end

  module SdcStampsPrintForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo

    # include Weight
    # include Service
    # include AdvancedOptions
    # include PrintOnTextbox
    # include StampsPrintPreview
    # include PrintFormBlurOut
    #
    # page_object(:serial_number) { { xpath: 'xxxxxxx' } }
    # sdc_number(:serial_number) { { xpath: 'xxxxxxx' } }
    # sdc_number(:quantity) { { xpath: 'xxxxxxx' } }

  end
end
