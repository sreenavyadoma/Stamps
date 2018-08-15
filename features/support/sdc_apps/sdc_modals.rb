module SdcWebsite
  module SdcModals
    class SdcRatingError < SdcPage
      page_object(:window_title) { { xpath: '//div[text()="Error"]' } }
      page_object(:body) { { xpath: '//div[contains(@class, "sdc-warning dialogue-content-body")]/div/div' } }
      page_object(:ok) { { xpath: '//span[contains(text(), "OK")]' } }
      page_object(:close) { { xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]' } }

    end

    class SdcWhatsNew < SdcPage
      page_object(:title) { { xpath: '//div[contains(text(), "What")]' } }
      page_object(:close) { { xpath: '//span[contains(text(), "Close")]' } }
      page_object(:more_info) { { xpath: '//span[contains(text(), "More Info")]' } }
    end

    def whats_new
      SdcWhatsNew.new
    end
    module_function :whats_new

    def rating_error
      SdcRatingError.new
    end
    module_function :rating_error
  end
end