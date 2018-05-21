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

    class MailTo < SdcPage
      page_object(:text_area, tag: :text_area) { { xpath: '//textarea[@name="freeFormAddress"]' } }
      page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-matltocountrydroplist-trigger-picker"]' } }
      page_objects(:dom_text_field, index: 1, tag: :text_field) { { xpath: '//input[@name="ShipCountryCode"]' } }
      page_objects(:int_text_field, index: 2, tag: :text_field) { { xpath: '//input[@name="ShipCountryCode"]' } }
      page_object(:link) { { xpath: 'xxxxxxx' } }
      page_object(:name) { { xpath: 'xxxxxxx' } }
      page_object(:company) { { xpath: 'xxxxxxx' } }
      page_object(:address_1) { { xpath: 'xxxxxxx' } }
      page_object(:address_2) { { xpath: 'xxxxxxx' } }
      page_object(:city) { { xpath: 'xxxxxxx' } }
      page_object(:province) { { xpath: 'xxxxxxx' } }
      page_object(:postal_code) { { xpath: 'xxxxxxx' } }
      page_object(:phone) { { xpath: 'xxxxxxx' } }

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

    # include MailTo
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
