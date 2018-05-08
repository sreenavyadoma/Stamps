module SdcWebsite
  class SdcCustomsForm < SdcPage
    page_object(:text_field) { {xpath: '//*[contains(@class, "x-toolbar-white")]//*[contains(@id, "btnWrap")]'} }

    def package_contents
    end

    def non_delivery
    end

    def internal_transaction
    end

    def item(num)
      self.class.page_object(:item_description) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='Description'])[#{num}]"} }
      self.class.page_object(:hs_tariff) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='TariffNo'])[#{num}]"} }

      self.class.page_object(:delete) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//a[contains(@class, 'x-btn-transparent-small')])[#{num}]"} }
    end
  end
end
