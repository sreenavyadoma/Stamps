module SdcMail
  module SdcMailFloatingModals

    class SdcNotificationBar < SdcPage
      page_object(:close) { {xpath: '//span[contains(@class, "sdc-icon-message-close-dark")]'} }
      page_object(:settings_link) { {xpath: '//span[text()="Settings"]'} }
    end
    class SdcManagePrintOptions < SdcPage
      page_object(:search, tag: :text_field) { {xpath: '//input[@placeholder="Search"]'} }
      page_object(:save) { {xpath: '//span[contains(text(), "Save")]'} }
      page_object(:close) { {xpath: '//span[contains(@class, "x-btn-icon-el")]'} }
      page_object(:search_button) { {xpath: '//div[contains(@class, "x-form-search-trigger-grey")]'} }
      page_object(:search_option) { {xpath: '//span[contains(@class, "x-btn-icon-el")]'} }
      page_object(:print_verify) { {xpath: '//table[contains(@id, "tableview")]' } }
      page_object(:print_chooser) { {xpath: '"//table[contains(@id, "tableview")]//tbody//tr//td[1]//div//div" '} }
      checkbox(:print_option_checkbox, :print_chooser, :print_verify, 'class', 'x-grid-item-selected')
      page_object(:single_grid_item) { {xpath: '//table[contains(@id, "tableview")]//tbody//tr//td[2]//div' } }
      page_object(:grid) { {xpath: '//table[contains(@id, "tableview")]' } }
    end

    class SdcManageShippingAddresses < SdcPage
    end

    class SdcEditMailingAddress < SdcPage
    end
    class MailSettingsModal < SdcPage
      page_object(:title) { {xpath: '//div[text()="Settings"]'} }
      page_object(:postdate_text_field) { {xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[2]'} }
      page_object(:postdate_drop_down) { {xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[2]'} }

      page_object(:logoff_text_field) { {xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[1]'} }
      page_object(:logoff_drop_down) { {xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[1]'} }

      page_object(:balance_text_field) { {xpath: '(//*[contains(@id, "generaltabview")]//input[contains(@class, "x-form-text")])[3]'} }
      page_object(:balance_drop_down) { {xpath: '(//*[contains(@id, "generaltabview")]//div[contains(@class, "x-form-arrow-trigger")])[3]'} }
      page_object(:close) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      def selection(str)
        page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class SdcExtraServices < SdcPage
      page_object(:title) { {xpath: '//div[text()="Extra Services"]'} }
      page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
      page_object(:save) { {id: 'sdc-extraservices-savebtn-btnInnerEl'} }
      page_object(:label_200) { {xpath: '//u[text()="Label 200 or 200-N"]'} }
      page_object(:form_3811) { {xpath: '//u[text()="Form 3811"]'} }
      page_object(:total) { { id: 'sdc-extraservices-totalcostlabel' } }

      text_field(:value_text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-valuenumberfield-inputEl' } }
      page_object(:value_increment) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
      page_object(:value_decrement) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
      sdc_number(:value, :value_text_field, :value_increment, :value_decrement)

      page_object(:rr_chooser) { {id: 'sdc-extraserviceswin-rrcheckbox-displayEl'} }
      page_object(:rr_verify) { {xpath: '//*[@id="sdc-extraserviceswin-rrcheckbox-bodyEl"]/..' } }
      checkbox(:return_receipt, :rr_chooser, :rr_verify, 'class', 'checked')

      page_object(:rd_chooser) { {id: 'sdc-extraserviceswin-rdcheckbox-displayEl'} }
      page_object(:rd_verify) { {xpath: '//*[@id="sdc-extraserviceswin-rdcheckbox-bodyEl"]/..' } }
      checkbox(:restricted_delivery, :rd_chooser, :rd_verify, 'class', 'checked')

      text_field(:cod_text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-codnumberfield-inputEl' } }
      page_object(:cod_increment) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
      page_object(:cod_decrement) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
      sdc_number(:cod, :cod_text_field, :cod_increment, :cod_decrement)

      page_object(:nnd_chooser) { {id: 'sdc-extraserviceswin-nndcheckbox-displayEl'} }
      page_object(:nnd_verify) { {xpath: '//*[@id="sdc-extraserviceswin-nndcheckbox-bodyEl"]/..' } }
      checkbox(:notice_non_delivery, :nnd_chooser, :nnd_verify, 'class', 'checked')

      page_object(:fragile_chooser) { {id: 'sdc-extraserviceswin-shcheckbox-displayEl'} }
      page_object(:fragile_verify) { {xpath: '//*[@id="sdc-extraserviceswin-shcheckbox-bodyEl"]/..' } }
      checkbox(:fragile, :fragile_chooser, :fragile_verify, 'class', 'checked')

      page_object(:return_rec_m_chooser) { {id: 'sdc-extraserviceswin-rrmcheckbox-displayEl'} }
      page_object(:return_rec_m_verify) { {xpath: '//*[@id="sdc-extraserviceswin-rrmcheckbox-bodyEl"]/..' } }
      checkbox(:return_receipt_merchandise, :return_rec_m_chooser, :return_rec_m_verify, 'class', 'checked')

      page_object(:non_rectangular_chooser) { {id: 'sdc-extraserviceswin-notrectangularcheckbox-displayEl'} }
      page_object(:non_rectangular_verify) { {xpath: '//*[@id="sdc-extraserviceswin-notrectangularcheckbox-bodyEl"]/..' } }
      checkbox(:non_rectangular, :non_rectangular_chooser, :non_rectangular_verify, 'class', 'checked')

      page_object(:hold_pickup_chooser) { {id: 'sdc-extraserviceswin-hfpucheckbox-displayEl'} }
      page_object(:hold_pickup_verify) { {xpath: '//*[@id="sdc-extraserviceswin-hfpucheckbox-bodyEl"]/..' } }
      checkbox(:hold_pickup, :hold_pickup_chooser, :hold_pickup_verify, 'class', 'checked')

      page_object(:security_price) { { id: 'sdc-extraserviceswin-securitypricelabel' } }
      page_object(:return_receipt_price) { { id: 'sdc-extraserviceswin-rrpricelabel' } }
      page_object(:restricted_delivery_price) { { id: 'sdc-extraserviceswin-rdpricelabel' } }
      page_object(:cod_price) { { id: 'sdc-extraserviceswin-codpricelabel' } }
      page_object(:notice_non_delivery_price) { { id: 'sdc-extraserviceswin-nndpricelabel' } }
      page_object(:handling_price) { { id: 'sdc-extraserviceswin-contentpricelabel' } }
      page_object(:fragile_price) { { id: 'sdc-extraserviceswin-shpricelabel' } }
      page_object(:return_receipt_m_price) { { id: 'sdc-extraserviceswin-rrmpricelabel' } }
      page_object(:hold_pickup_price) { { id: 'sdc-extraserviceswin-hfpupricelabel' } }

      def security
        SdcExtraServicesSecurity.new
      end

      def handling
        SdcExtraServicesHandling.new
      end

    end

    class SdcExtraServicesSecurity < SdcPage
      page_object(:drop_down) { { id: 'sdc-extraserviceswin-securitydroplist-trigger-picker' } }
      page_object(:text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-securitydroplist-inputEl' } }

      def selection_element(name, value)
        page_object(name) { { xpath: "//li[text()='#{value}']" } }
      end
    end

    class SdcExtraServicesHandling < SdcPage
      page_object(:drop_down) { { id: 'sdc-extraserviceswin-contentdroplist-trigger-picker' } }
      page_object(:text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-contentdroplist-inputEl' } }

      def selection_element(name, str)
        page_object(name) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class SdcLabel200 < SdcPage
      page_object(:title) { {xpath: '//div[text()="Label 200 or 200-N"]'} }
      page_object(:x_btn) { {xpath: '//div[text()="Label 200 or 200-N"]/../..//*[contains(@class, "close")]'} }
    end

    class SdcForm3811 < SdcPage
      page_object(:title) { {xpath: '//div[text()="Form 3811"]'} }
      page_object(:x_btn) { {xpath: '//div[text()="Form 3811"]/../..//*[contains(@class, "close")]'} }
    end

    class SdcValueMustBeShown < SdcPage
      page_object(:title) { {xpath: '//div[text()="Value Must be Shown"]'} }
      page_object(:continue) { {xpath: '//*[text()="Continue"]/../..'} }
      page_object(:cancel) { {xpath: '//div[text()="Cancel"]'} }
      page_object(:x_btn) { {xpath: '//div[text()="Value Must be Shown"]/../..//*[contains(@class, "close")]'} }
    end

    class SdcSpecialContentsWarning < SdcPage
      page_object(:title) { {xpath: '//*[text()="Special Contents Warning"]'} }
      page_object(:i_agree) { {xpath: '//*[text()="I Agree"]'} }
      page_object(:more_info) { {xpath: '//*[text()="More Info"]'} }
      page_object(:x_btn) { {xpath: '//div[text()="Special Contents Warning"]/../..//*[contains(@class, "close")]'} }
    end

    class SdcSearchContacts < SdcPage
      page_object(:title) { {xpath: '//*[text()="Search Contacts"]'} }
      page_object(:cancel) { {id: 'modalCancel'} }
      page_object(:x_btn) { {xpath: '//div[text()="Search Contacts"]/../..//*[contains(@class, "close")]'} }

    end

    def notification_bar
      SdcNotificationBar.new
    end
    module_function :notification_bar

    def manage_print_options
      SdcManagePrintOptions.new
    end
    module_function :manage_print_options

    def manage_shipping_addresses
      SdcManageShippingAddresses.new
    end
    module_function :manage_shipping_addresses

    def edit_mailing_address
      SdcEditMailingAddress.new
    end
    module_function :edit_mailing_address

    def settings
      MailSettingsModal.new
    end
    module_function :settings

    def extra_services
      SdcExtraServices.new
    end
    module_function :extra_services

    def label_200
      SdcLabel200.new
    end
    module_function :label_200

    def form_3811
      SdcForm3811.new
    end
    module_function :form_3811

    def value_must_be_shown
      SdcValueMustBeShown.new
    end
    module_function :value_must_be_shown

    def special_contents_warning
      SdcSpecialContentsWarning.new
    end
    module_function :special_contents_warning

    def search_contacts
      SdcSearchContacts.new
    end
    module_function :search_contacts
  end
end

