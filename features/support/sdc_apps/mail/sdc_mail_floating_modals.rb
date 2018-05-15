module SdcMail
  class SdcManagePrintOptions < SdcPage
    page_object(:search, tag: :text_field) { {xpath: "//input[@placeholder='Search']"} }
    page_object(:save) { {xpath: '//span[contains(text(), "Save")]'} }
    page_object(:close) { {xpath: '//span[contains(@class, "x-btn-icon-el")]'} }

    page_object(:search_option) { {xpath: '//span[contains(@class, "x-btn-icon-el")]'} }
    page_object(:print_option) { {xpath: "//table[contains(@id, 'tableview')]" } }
    checkbox(:print_option_checkbox, :print_option, :print_option, "class", "x-grid-item-selected")
    page_objects(:grid) { {xpath: "//table[contains(@id, 'tableview')]" } }


  end

  module SdcMailFloatingModals
    def manage_print_options
      SdcManagePrintOptions.new
    end
    module_function :manage_print_options
  end
end