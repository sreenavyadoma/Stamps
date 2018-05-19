module SdcMail

  module SdcPrintMailFrom

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

  module SdcPrintMailTo

    class MailToCountry < SdcPage
      page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-matltocountrydroplist-trigger-picker"]' } }
      page_object(:text_field) { { xpath: 'xxxxxxx' } }

      def selection(name, str)
        page_object(name) { { xpath: "#{str}" } }
      end
    end

    class MailTo < SdcPage
      def initialize
        page_object(:text_area, tag: :text_area) { { xpath: '//textarea[@name="freeFormAddress"]' } }
      end

      def country
        MailToCountry.new
      end

      def respond_to_missing(name, include_private = false)
        text_area.respond_to?(name, include_private) || super
      end

      def method_missing(name, *args, &block)
        super unless text_area.respond_to? name
        text_area.send(name, *args, &block)
      end
    end

    def mail_to
      MailTo.new
    end
  end

  class SdcMailStamps < SdcPage
    include SdcPrintMailFrom
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
