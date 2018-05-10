module SdcWebsite
  class SdcCustomsForm < SdcPage
    page_object(:title) { {xpath: '//*[text()="Customs Information"]'} }
    page_object(:add_item) { {xpath: '//*[contains(@class, "x-toolbar-white")]//*[contains(@id, "btnWrap")]'} }

    page_object(:agree_chooser) { {xpath: '//*[contains(@class, "x-docked-bottom")]//*[contains(@class, "x-form-type-checkbox")]//input'} }
    page_object(:agree_verify) { {xpath: '//*[contains(@class, "x-docked-bottom")]//div[contains(@class, "x-form-type-checkbox")]'} }
    checkbox(:agree, :agree_chooser, :agree_verify, 'class', 'checked')

    page_object(:close) { {xpath: '//*[contains(@class, "x-window")]//*[text()="Close"]'} }
    page_object(:x_btn) { {xpath: '//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
    page_object(:total) { {xpath: '//*[contains(@class, "x-window")]//*[contains(text(), "Total:")]/..'} }
    page_object(:usps_warning) { {xpath: '//*[text()="You must agree to the USPS Privacy Act Statement"]'} }

    page_object(:usps_privacy_act) { {xpath: '//*[text()="USPS Privacy Act Statement"]/../../..'} }
    page_object(:restriction_prohibitions) { {xpath: '//*[text()="USPS Privacy Act Statement"]/../../..'} }

    page_objects(:associated_items) { {xpath: '//*[contains(@id, "associatedcustomsitems")]/*[contains(@id, "singlecustomsitem")]'} }

    # optional
    page_object(:itn, tag: :text_field) { {xpath: '//*[@name="AES"]'} }
    page_object(:more_info, tag: :text_field) { {xpath: '//*[@name="CustomsComments"]'} }

    # optional
    page_object(:license, tag: :text_field) { {xpath: '//*[@name="CustomsLicenseNumber"]'} }
    page_object(:certificate, tag: :text_field) { {xpath: '//*[@name="CustomsCertificateNumber"]'} }
    page_object(:invoice, tag: :text_field) { {xpath: '//*[@name="CustomsInvoiceNumber"]'} }


    def package_contents
      PackageContents.new
    end

    def non_delivery
      NonDelivery.new
    end

    def internal_transaction
      InternalTransaction.new
    end

    def item
      CustomsFormItem.new
    end
  end

  class CustomsFormItem < SdcPage
    def item_description_element(num)
      self.class.page_object(:item_description, tag: :text_field) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='Description'])[#{num}]"} }
    end

    def hs_tariff_element(num)
      self.class.page_object(:hs_tariff, tag: :text_field) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='TariffNo'])[#{num}]"} }
    end

    def delete_element(num)
      self.class.page_object(:delete) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//a[contains(@class, 'x-btn-transparent-small')])[#{num}]"} }
    end

    def qty_element(num)
      self.class.text_field(:qty_tf, tag: :text_field) { {xpath: "(//*[@name='Quantity'])[#{num}]"} }
      self.class.page_object(:qty_dec) { {xpath: "(//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'down')])[#{num}]"} }
      self.class.page_object(:qty_inc) { {xpath: "(//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'up')])[#{num}]"} }
      self.class.number(:qty, :qty_tf, :qty_inc, :qty_dec)
    end

    def unit_price_element(num)
      self.class.text_field(:unit_price_tf, tag: :text_field) { {xpath: "(//*[@name='Value'])[#{num}]"} }
      self.class.page_object(:unit_price_dec) { {xpath: "(//*[@name='Value']/../following-sibling::*/div[contains(@class, 'down')])[#{num}]"} }
      self.class.page_object(:unit_price_inc) { {xpath: "(//*[@name='Value']/../following-sibling::*/div[contains(@class, 'up')])[#{num}]"} }
      self.class.number(:unit_price, :unit_price_tf, :unit_price_dec, :unit_price_inc)
    end

    def made_in
      MadeIn.new
    end
  end

  class MadeIn < SdcPage
    def text_field_element(num)
      self.class.text_field(:text_field, tag: :text_field) { {xpath: "(//*[@name='OriginCountryCode'])[#{num}]"} }
    end

    def drop_down_element(num)
      self.class.text_field(:drop_down) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[contains(@class, 'x-form-arrow-trigger')])[#{num}]"} }
    end

    def selection_element(num, str)
      self.class.page_object(:selection) { {xpath: "(//li[text()='#{str}'])[#{num+1}]"} }
    end
  end

  class PackageContents < SdcPage
    page_object(:text_field) { {xpath: '//*[@name="CustomsContents"]'} }
    page_object(:drop_down) { {xpath: '//*[contains(@id, "packagecontentsdroplist")]'} }

    def selection_element(name: :selection, value: "Merchandise")
      self.class.page_object(name) { {xpath: "//li[text()='#{value}']"} }
    end
  end

  class NonDelivery < SdcPage
    page_object(:text_field) { {xpath: '//*[@name="NonDelivery"]'} }
    page_object(:drop_down) { {xpath: '//*[contains(@id, "nondeliveryoptionsdroplist")]'} }

    def selection_element(name: :selection, value: "Return to sender")
      self.class.page_object(name) { {xpath: "//li[text()='#{value}']"} }
    end
  end

  class InternalTransaction < SdcPage
    page_object(:text_field) { {xpath: '//*[@name="IsITNRequired"]'} }
    page_object(:drop_down) { {xpath: '//*[contains(@id, "internaltransactiondroplist")]'} }

    def selection_element(name: :selection, value: "Not required")
      self.class.page_object(name) { {xpath: "//li[text()='#{value}']"} }
    end
  end
end