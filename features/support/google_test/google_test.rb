module Google
  class GoogleSearchPage < SdcPage
    page_object(:text_field, tag: :text_field) { { xpath: '' } }
    page_object(:google_image) { { xpath: '' } }
    page_object(:google_search) { { xpath: '' } }
  end

  class << self
    def visit(str)
    end

    def search_page
    end

    def page_source
    end
  end
end