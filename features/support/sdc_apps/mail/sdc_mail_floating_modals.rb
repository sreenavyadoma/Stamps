module SdcMail
  class SdcManagePrintOptions < SdcPage
    page_object(:search, tag: :text_field) { {xpath: "//input[@placeholder='Search']"} }
    page_object(:save) { {xpath: '//span[contains(text(), "Save")]'} }
    page_object(:close) { {xpath: '//span[contains(@class, "x-btn-icon-el")]'} }
    page_object(:search_button) { {xpath: '//div[contains(@class, "x-form-search-trigger-grey")]'} }
    page_object(:search_option) { {xpath: '//span[contains(@class, "x-btn-icon-el")]'} }
    page_object(:print_verify) { {xpath: "//table[contains(@id, 'tableview')]" } }
    page_object(:print_chooser) { {xpath: "//table[contains(@id, 'tableview')]//tbody//tr//td[1]//div//div" } }
    checkbox(:print_option_checkbox, :print_chooser, :print_verify, 'class', 'x-grid-item-selected')
    page_object(:single_grid_item) { {xpath: "//table[contains(@id, 'tableview')]//tbody//tr//td[2]//div" } }
    page_object(:grid) { {xpath: "//table[contains(@id, 'tableview')]" } }
  end

  class SdcManageShippingAddresses < SdcPage

  end

  class SdcEditMailingAddress < SdcPage

  end

  module SdcMailFloatingModals
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

  end
end
