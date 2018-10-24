module SdcContacts

  class << self

    def loading_contacts
      klass = Class.new(SdcPage) do
        page_object(:loading) { { xpath: '//*[contains(text(), "Loading contacts...")]' } }
      end
      klass.new.loading
    end

    def verifying_account
      klass = Class.new(SdcPage) do
        page_object(:verifying_account) { {xpath: '//*[contains(text(), "Verifying")]'} }
      end
      klass.new.verifying_account
    end

    def toolbar
      Toolbar
    end

    def filter_panel
      FilterPanel
    end

    def grid
      Grid
    end
  end

end
