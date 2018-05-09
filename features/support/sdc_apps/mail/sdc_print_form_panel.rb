module SdcMail

  class SdcUpgradePlan < SdcPage
    page_object(:window_title) { {xpath: ''} } # @window_title = StampsField.new(driver.div(text: "Upgrade Plan"))
    page_object(:upgrade_now) { {xpath: ''} }
    page_object(:x_btn) { {xpath: ''} }
    page_object(:not_yet) { {xpath: ''} }
    page_object(:paragraph) { {xpath: ''} }
  end

  class SdcManagePrintOptionsModal < SdcPage

    page_object(:search) { {xpath: ''} }
    page_object(:save) { {xpath: ''} }
    page_object(:close) { {xpath: ''} }
    page_object(:search_field) { {xpath: ''} }
    page_object(:search_results) { {xpath: ''} }

    page_object(:chooser) { {xpath: ''} }
    page_object(:verify) { {xpath: ''} }
    chooser(:result_checkbox, :chooser, :verify,'class', 'selected' )

    page_object(:xxxx) { {xpath: ''} }
  end

  class SdcPrintOn < SdcPage

    page_object(:xxxxxxx) { {xpath: ''} }
    page_object(:drop_down) { {xpath: '//*[starts-with(@id, "printmediadroplist-")][contains(@id, "-trigger-picker")]'} }
    page_object(:text_field) { {xpath: '//*[@name="PrintMedia"]'} }

    def selection(name: :selection_element, lov: 'Manage Printing Options')
      if lov.eql? 'Manage Printing Options'
        self.class.page_object(name, tag: :li) { {xpath: '//*[contains(text(), "Manage Printing Options")]'} }
      else
        media = data_for(:mail_print_media, {})[lov]
        xpath = "//li[starts-with(@class, '#{media.split(',').first}')][@data-recordindex='#{media.split(',').first}']"
        self.class.page_object(name) { {xpath: xpath} }
      end
    end

  end

end
