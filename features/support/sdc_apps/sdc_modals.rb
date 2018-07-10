module SdcWebsite
  module SdcModals
    class SdcWhatsNew < SdcPage
      page_object(:title) { {xpath: '//div[contains(text(), "What")]'} }
      page_object(:close) { {xpath: '//span[contains(text(), "Close")]'} }
      page_object(:more_info) { {xpath: '//span[contains(text(), "More Info")]'} }
    end

    #
    def whats_new
      SdcWhatsNew.new
    end
    module_function :whats_new
  end
end