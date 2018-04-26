module Stamps
  module SdcOrders
    class SdcOrdersModalsPrintOn < SdcPage
      page_object(:text_field, tag: :text_field) { {xpath: '//input[contains(@id, "printmediadroplist")]'} }
      page_object(:drop_down) { {xpath: '//*[contains(@id, "printmediadroplist")]/div[contains(@id, "trigger-picker")]'} }
      page_object(:blur_out) { {xpath: '//span[text()="Printing On:"]'} }

      def selection(str)
        self.class.page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class SdcOrdersModalsPrintShipDate < SdcPage
      page_object(:text_field, tag: :text_field) { {xpath: '//input[contains(@id, "datefield")]'} }
      page_object(:drop_down) { {xpath: '//*[contains(@class, "x-form-date-trigger")]'} }
      # page_object(:blur_out) { {xpath: '//span[text()="Ship Date:"]'} }
    end

    class SdcOrdersModalsPrinter < SdcPage
      page_object(:text_field, tag: :text_field) { {id: 'sdc-printpostagewindow-printerdroplist-inputEl'} }
      page_object(:drop_down) { {id: 'sdc-printpostagewindow-printerdroplist-trigger-picker'} }

      def selection(str)
        self.class.page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class SdcOrdersModalsPrint < SdcPage
      page_object(:title) { {xpath: '//div[contains(@id, "printwindow")]//div[contains(text(),"You have")]'} }
      page_object(:print) { {id: 'sdc-printwin-printbtn-btnWrap'} }
      page_object(:print_sample) { {} }
      page_object(:total) { {xpath: '//*[contains(@class, "sdc-displayfield-font-style")]//div/*[contains(@id, "displayfield")]'} }
      page_object(:close) { {xpath: '//span[contains(@class, "sdc-icon-mobile-close-light")]'} }

      def print_on
        @print_on ||= SdcOrdersModalsPrintOn.new
      end

      def ship_date
        @ship_date ||= SdcOrdersModalsPrintShipDate.new
      end

      def printer
        @printer ||= SdcOrdersModalsPrinter.new
      end
    end

    class SdcOrdersModalsSettingsGeneral < SdcPage
      page_object(:title) { {xpath: '//label[text()="General Settings"]'} }
      page_object(:postdate_text_field) { {xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[2]'} }
      page_object(:postdate_drop_down) { {xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[2]'} }

      page_object(:logoff_text_field) { {xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[1]'} }
      page_object(:logoff_drop_down) { {xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[1]'} }

      page_object(:balance_text_field) { {xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[3]'} }
      page_object(:balance_drop_down) { {xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[3]'} }

      def selection(str)
        self.class.page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class SdcOrdersModalsSettingsStores < SdcPage

    end
    class SdcOrdersModalsSettingsIntl < SdcPage

    end
    class SdcOrdersModalsSettingsLabel < SdcPage

    end

    class SdcOrdersModalsSettings < SdcPage
      page_object(:general) { {xpath: '//*[text()="General"]'} }
      page_object(:stores) { {xpath: '//*[text()="Stores"]'} }
      page_object(:international) { {xpath: '//*[text()="International"]'} }
      page_object(:label_msgs) { {xpath: '//*[text()="Label Messages"]'} }
      page_object(:title) { {xpath: '(//*[text()="Orders Settings"])[1]'} }
      # page_object(:done) { {id: ''} }     //generated dynamically for each view
      page_object(:close) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }

      def general_settings
        @general_settings ||= SdcOrdersModalsSettingsGeneral.new
      end

      def stores_settings
        @stores_settings ||= SdcOrdersModalsSettingsStores.new
      end

      def intl_settings
        @intl_settings ||= SdcOrdersModalsSettingsIntl.new
      end

      def label_msgs_settings
        @label_msgs_settings ||= SdcOrdersModalsSettingsLabel.new
      end
    end

    class SdcOrdersModals < SdcPage
      def print
        @print ||= SdcOrdersModalsPrint.new
      end

      def settings
        @settings ||= SdcOrdersModalsSettings.new
      end
    end
  end
end