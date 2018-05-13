module SdcOrders
  module OrdersFloatingModals

    class PrintModalPrintOn < SdcPage
      page_object(:text_field, tag: :text_field) { {xpath: '//input[contains(@id, "printmediadroplist")]'} }
      page_object(:drop_down) { {xpath: '//*[contains(@id, "printmediadroplist")]/div[contains(@id, "trigger-picker")]'} }
      page_object(:blur_out) { {xpath: '//span[text()="Printing On:"]'} }

      def selection(str)
        page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class ShipDateMonthPicker < SdcPage
      page_object(:ok) { {xpath: '//*[@class="x-monthpicker-buttons"]//*[text()="OK"]'} }
      page_object(:cancel) { {xpath: '//*[@class="x-monthpicker-buttons"]//*[text()="Cancel"]'} }
      page_object(:year_prev) { {xpath: '//*[contains(@class,"x-monthpicker-yearnav-prev")]'} }
      page_object(:year_next) { {xpath: '//*[contains(@class,"x-monthpicker-yearnav-next")]'} }

      def selection_month(month)
        page_object(:month) { {xpath: "//a[text()='#{month}']"} }
      end

      def selection_year(year)
        page_object(:year) { {xpath: "//*[contains(@class, 'x-monthpicker-year')]//a[text()='#{year}']"} }
      end
    end

    class ShipDateDatepicker < SdcPage
      page_object(:head_link) { {xpath: '//*[@class="x-datepicker-header"]//span[contains(@id, "btnWrap")]'} }
      page_object(:today) { {xpath: '//*[contains(@class, "x-datepicker-footer")]//*[contains(@id, "btnWrap")]'} }

      def selection_day(day)
        page_object(:day) { {xpath: "//td[contains(@class, 'x-datepicker-active')]/*[text()='#{day}']/.."} }
      end

      def month_picker
        @month_year ||= ShipDateMonthPicker.new
      end
    end

    class PrintShipDate < SdcPage
      page_object(:text_field, tag: :text_field) { {xpath: '//input[contains(@id, "datefield")]'} }
      page_object(:drop_down) { {xpath: '//*[contains(@class, "x-form-date-trigger")]'} }

      def datepicker
        ShipDateDatepicker.new
      end
    end

    class PrintModalPrinter < SdcPage
      page_object(:text_field, tag: :text_field) { {id: 'sdc-printpostagewindow-printerdroplist-inputEl'} }
      page_object(:drop_down) { {id: 'sdc-printpostagewindow-printerdroplist-trigger-picker'} }

      def selection(str)
        page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class OrdersPrintModal < SdcPage
      page_object(:title) { {xpath: '//div[contains(@id, "printwindow")]//div[contains(text(),"You have")]'} }
      page_object(:print) { {id: 'sdc-printwin-printbtn-btnWrap'} }
      page_object(:print_sample) { {} }
      page_object(:total) { {xpath: '//*[contains(@class, "sdc-displayfield-font-style")]//div/*[contains(@id, "displayfield")]'} }
      page_object(:close) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }

      def print_on
        PrintModalPrintOn.new
      end

      def ship_date
        PrintShipDate.new
      end

      def printer
        PrintModalPrinter.new
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
        page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class OrdersSettingsStores < SdcPage

    end
    class SdcOrdersSettingsInt < SdcPage

    end
    class OrdersSettingsLabel < SdcPage

    end

    class OrdersSettingsModal < SdcPage
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
        @stores_settings ||= OrdersSettingsStores.new
      end

      def int_settings
        @intl_settings ||= SdcOrdersSettingsInt.new
      end

      def label_msgs_settings
        @label_msgs_settings ||= OrdersSettingsLabel.new
      end
    end

    def print
      @print ||= OrdersPrintModal.new
    end
    module_function :print

    def settings
      @settings ||= OrdersSettingsModal.new
    end
    module_function :settings

  end
end
