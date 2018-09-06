module Google
  class GoogleSearchPage < SdcPage
    page_object(:text_field) { { xpath: '//input[@name="q"]' } }
    page_object(:google_image) { { xpath: '//img[@alt="Google"]' } }
    page_object(:google_search) { { xpath: '//div[@class="FPdoLc VlcLAe"]//input[@value="Google Search"]' } }
  end

  class << self
    def visit(str)
      browser.goto(str)
    end

    def search_page
      GoogleSearchPage.new
    end

    def page_source
      browser.text
    end
  end
end