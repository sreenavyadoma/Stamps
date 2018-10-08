module SdcHistory

  class << self
    def loading
      klass = Class.new(SdcPage) do
        page_object(:loading) { { xpath: '//div[text()="Loading..."]' } }
      end
      klass.new.loading
    end

    def toolbar
      SdcHistoryToolbar
    end

    def filter_panel
      HistoryFilterPanel
    end
  end
end