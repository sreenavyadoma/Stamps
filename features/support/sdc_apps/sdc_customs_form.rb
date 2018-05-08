module SdcWebsite
  class SdcCustomsForm < SdcPage
    page_object(:add_item) { {xpath: '//*[contains(@class, "x-toolbar-white")]//*[contains(@id, "btnWrap")]'} }
    page_object(:agree) { {xpath: '//*[contains(@class, "x-docked-bottom")]//*[contains(@class, "x-form-type-checkbox")]//input'} }
    page_object(:close) { {xpath: '//*[contains(@class, "x-window")]//*[text()="Close"]'} }
    page_object(:total) { {xpath: '//*[contains(@class, "x-window")]//*[contains(text(), "Total:")]/..'} }

    def package_contents
    end

    def non_delivery
    end

    def internal_transaction
    end
# customs_form.item.item_description_ini(1)
# customs_form.item.hs_tariff_ini(1)
# customs_form.item.delete_ini(1)
    #customs_form.item.item_description
    def item
      CustomsFormItem.new
    end
  end

  class CustomsFormItem < SdcPage

    def item_description_ini(num)
      self.class.page_object(:item_description) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='Description'])[#{num}]"} }
    end

    def hs_tariff_ini(num)
      self.class.page_object(:hs_tariff) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//*[@name='TariffNo'])[#{num}]"} }
    end

    def delete_ini(num)
      self.class.page_object(:delete) { {xpath: "(//*[contains(@id, 'singlecustomsitem')]//a[contains(@class, 'x-btn-transparent-small')])[#{num}]"} }
    end

    def qty_ini(num)
      self.class.text_field(:qty_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "lengthnumberfield")])[1]'} }
      self.class.page_object(:qty_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
      self.class.page_object(:qty_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
      self.class.number(:qty, :qty_tf, :qty_inc, :qty_dec)
    end

    # def qty
    #   CustomsFormItemQty.new
    # end
  end

  # class CustomsFormItemQty < SdcPage
  #   def set_item_qty(num)
  #     self.class.text_field(:qty_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "lengthnumberfield")])[1]'} }
  #     self.class.page_object(:qty_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
  #     self.class.page_object(:qty_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
  #     self.class.number(:qty, :qty_tf, :qty_inc, :qty_dec)
  #   end
  # end
end