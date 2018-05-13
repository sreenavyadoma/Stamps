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

    page_object(:drop_down) { {xpath: '//*[starts-with(@id, "printmediadroplist-")][contains(@id, "-trigger-picker")]'} }
    page_object(:text_field) { {xpath: '//*[@name="PrintMedia"]'} }

    #by_locator(:selection_field, locator: :xpath) { |lov| "//li[text()='#{lov}']" }

    def selection(name: :selection_element, lov: 'Manage Printing Options...')
      page_object(name) { {xpath: "//li[text()='#{lov}']"} }
    end

  end

end
