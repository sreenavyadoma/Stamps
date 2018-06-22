module SdcMail
  module SdcMailFloatingModals
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

    def settings
      MailSettingsModal.new
    end
    module_function :settings



  end
end
