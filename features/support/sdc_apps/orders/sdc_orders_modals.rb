module Stamps
  module SdcOrders
    class SdcOrdersModalsPrintOn < SdcPage
      page_obj(:text_field, tag: :text_field) { {xpath: '//input[contains(@id, "printmediadroplist")]'} }
      page_obj(:drop_down) { {xpath: '//*[contains(@id, "printmediadroplist")]/div[contains(@id, "trigger-picker")]'} }
      page_obj(:blur_out) { {xpath: '//span[text()="Printing On:"]'} }

      def selection(str)
        self.class.page_obj(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class SdcOrdersModalsPrintShipDate < SdcPage
      page_obj(:text_field, tag: :text_field) { {xpath: '//input[contains(@id, "datefield")]'} }
      page_obj(:drop_down) { {xpath: '//*[contains(@class, "x-form-date-trigger")]'} }
      page_obj(:blur_out) { {xpath: '//span[text()="Ship Date:"]'} }
    end

    class SdcOrdersModalsPrinter < SdcPage
      page_obj(:text_field, tag: :text_field) { {id: 'sdc-printpostagewindow-printerdroplist-inputEl'} }
      page_obj(:drop_down) { {id: 'sdc-printpostagewindow-printerdroplist-trigger-picker'} }

      def selection(str)
        self.class.page_obj(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class SdcOrdersModalsPrint < SdcPage
      page_obj(:title) { {xpath: '//div[contains(@id, "printwindow")]//div[contains(text(),"You have")]'} }
      page_obj(:print) { {id: 'sdc-printwin-printbtn-btnWrap'} }
      page_obj(:print_sample) { {} }
      page_obj(:total) { {xpath: '//*[contains(@class, "sdc-displayfield-font-style")]//div/*[contains(@id, "displayfield")]'} }
      page_obj(:close) { {xpath: '//span[contains(@class, "sdc-icon-mobile-close-light")]'} }

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

    class SdcOrdersModals < SdcPage
      def print
        @print ||= SdcOrdersModalsPrint.new
      end
    end
  end
end