module SdcMail
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

  class SdcWhatsNew < SdcPage
    page_object(:title) { {xpath: '//div[contains(text(), "What")]'} }
    page_object(:close) { {xpath: '//span[contains(text(), "Close")]'} }
    page_object(:more_info) { {xpath: '//span[contains(text(), "More Info")]'} }
  end

  class SdcManageShippingAddresses < SdcPage
  end

  class SdcEditMailingAddress < SdcPage
  end

  class SdcExtraServices < SdcPage
    page_object(:title) { {xpath: '//div[text()="Extra Services"]'} }
    page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
    page_object(:save) { {id: 'sdc-extraservices-savebtn-btnInnerEl'} }
    page_object(:label_200) { {xpath: '//u[text()="Label 200 or 200-N"]'} }
    page_object(:form_3811) { {xpath: '//u[text()="Form 3811"]'} }

    text_field(:value_text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-valuenumberfield-inputEl' } }
    page_object(:value_increment) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
    page_object(:value_decrement) { { xpath: '//*[@id="sdc-extraserviceswin-valuenumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
    sdc_number(:value, :value_text_field, :value_increment, :value_decrement)

    page_object(:rr_chooser) { {id: 'sdc-extraserviceswin-rrcheckbox-displayEl'} }
    page_object(:rr_verify) { {xpath: '//*[@id="sdc-extraserviceswin-rrcheckbox-bodyEl"]/..' } }
    checkbox(:return_receipt, :rr_chooser, :rr_verify, 'class', 'x-grid-item-selected')

    page_object(:rd_chooser) { {id: 'sdc-extraserviceswin-rdcheckbox-displayEl'} }
    page_object(:rd_verify) { {xpath: '//*[@id="sdc-extraserviceswin-rdcheckbox-bodyEl"]/..' } }
    checkbox(:restricted_delivery, :rd_chooser, :rd_verify, 'class', 'x-grid-item-selected')

    text_field(:cod_text_field, tag: :text_field) { { id: 'sdc-extraserviceswin-codnumberfield-inputEl' } }
    page_object(:cod_increment) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"up")]' } }
    page_object(:cod_decrement) { { xpath: '//*[@id="sdc-extraserviceswin-codnumberfield-trigger-spinner"]//*[contains(@class,"down")]' } }
    sdc_number(:cod, :cod_text_field, :cod_increment, :cod_decrement)

    page_object(:nnd_chooser) { {id: 'sdc-extraserviceswin-nndcheckbox-displayEl'} }
    page_object(:nnd_verify) { {xpath: '//*[@id="sdc-extraserviceswin-nndcheckbox-bodyEl"]/..' } }
    checkbox(:notice_non_delivery, :nnd_chooser, :nnd_verify, 'class', 'x-grid-item-selected')

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

    def selection_element(name, str)
      page_object(name) { { xpath: "//li[text()='#{str}']" } }
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


  module SdcMailFloatingModals
    def manage_print_options
      SdcManagePrintOptions.new
    end
    module_function :manage_print_options

    def whats_new
      SdcWhatsNew.new
    end
    module_function :whats_new

    def manage_shipping_addresses
      SdcManageShippingAddresses.new
    end
    module_function :manage_shipping_addresses

    def edit_mailing_address
      SdcEditMailingAddress.new
    end
    module_function :edit_mailing_address

    def extra_services
      SdcExtraServices.new
    end
    module_function :extra_services

    def label_200
      SdcLabel200.new
    end
    module_function :label_200

    def mode_3811
      SdcForm3811.new
    end
    module_function :mode_3811
  end
end
