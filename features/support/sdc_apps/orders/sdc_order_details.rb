module SdcOrders
  class SdcOrderDetailsShipFrom < SdcPage
    page_object(:drop_down) { {xpath: '(//div[starts-with(@id, "shipfromdroplist")]/div[contains(@id, "trigger-picker")])[1]'} }
    page_object(:text_field) { {xpath: '(//input[starts-with(@id, "shipfromdroplist")])[1]'} }

    def selection_element(str)
        return page_object(:selection) { {xpath: '(//li[contains(@class, "x-boundlist-item")])[1]'} } if str == "default"
        page_object(:selection) { {xpath: "//li[contains(text(), '#{str}')]"} }
    end
  end

  class SdcShipToCountryDom < SdcPage
    page_object(:drop_down) { {xpath: '//div[contains(@id, "matltocountrydroplist-trigger-picker")]'} }
    page_object(:text_field) { {xpath: '//input[contains(@id, "matltocountrydroplist")]'} }

    def selection(str)
      page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
    end
  end

  class SdcShipToCountryIntl < SdcPage
    page_object(:drop_down) { {xpath: '(//*[contains(@id, "international")]//*[contains(@id, "picker")])[1]'} }
    page_object(:text_field) { {xpath: '//div[contains(@id, "shiptoview-international")]//input[contains(@id, "combo")]'} }

    def selection(str)
      page_object(:selection_obj) { {xpath: "//li[text()='#{str}']"} }
    end
  end

  class SdcOrderDetailsService < SdcPage
    page_object(:cost, required: true, timeout: 40) { {xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[6]//label[contains(@class, "details-form-label")])[2]'} }
    page_object(:drop_down, required: true, timeout: 40) { {xpath: '(//div[contains(@id, "servicedroplist")]//div[contains(@id, "trigger-picker")])[1]'} }
    page_object(:text_field, required: true, timeout: 40) { {xpath: '(//input[contains(@id, "servicedroplist")])[1]'} }

    def selection(name: :selection_element, str: 'Manage Service Options...')
      page_object(name) { {xpath: "//li[@id='#{data_for(:orders_services, {})[str]}']"} }
    end
  end

  class SdcOrderDetailsInsurance < SdcPage
    page_object(:cost) { {xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[7]//label[contains(@class, "component")])[2]'} }

    page_object(:chooser_elem) { {xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//input[contains(@class, "checkbox")]'} }
    page_object(:verify_elem) { {xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//div[contains(@class, "checkbox")]'} }
    checkbox(:checkbox, :chooser_elem, :verify_elem, 'class', 'checked')

    text_field(:text_f, tag: :text_field) { {xpath: '(//input[contains(@id, "insurancefield")])[1]'} }
    page_object(:increment) { {xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
    page_object(:decrement) { {xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
    sdc_number(:amount, :text_f, :increment, :decrement)
  end

  class SdcOrderDetailsTracking < SdcPage
    page_object(:cost) { {xpath: '//*[contains(@class, "selected_tracking_cost")]'} }
    page_object(:drop_down) { {xpath: '(//div[contains(@id, "trackingdroplist")]//div[contains(@id, "trigger-picker")])[1]'} }
    page_object(:text_field) { {xpath: '(//input[contains(@id, "trackingdroplist")])[1]'} }

    def selection(str)
      page_object(:selection_obj) { {xpath: "//li//td[text()='#{str}']"} }
    end
  end

  class SdcOrderDetailsFooter < SdcPage
    label(:total_ship_cost) { {xpath: '//label[contains(@class, "total_cost")]'} }
    button(:print) { {xpath: '(//div[contains(@class, "footer")]//span[text()="Print"])[1]'} }
  end

  class SdcOrderDetailsDomestic < SdcPage
    page_object(:phone, tag: :text_field) { {xpath: '(//input[@name="ShipPhone"])[1]'} }
    page_object(:email, tag: :text_field) { {xpath: '(//input[@name="BuyerEmail"])[1]'} }
    page_object(:address, tag: :textarea) { {xpath: '//textarea[contains(@id, "shiptotextarea")]'} }
    page_object(:show_less) { {xpath: '//div[contains(@id, "domestic")]//span[text()="Less"]'} }

    def country
      SdcShipToCountryDom.new
    end
  end

  class SdcOrderDetailsInternational < SdcPage
    page_object(:name, tag: :text_field) { {xpath: '//input[@name="ShipName"]'} }
    page_object(:company, tag: :text_field) { {xpath: '//input[@name="ShipCompany"]'} }
    page_object(:address1, tag: :text_field) { {xpath: '//input[@name="ShipStreet1"]'} }
    page_object(:address2, tag: :text_field) { {xpath: '//input[@name="ShipStreet2"]'} }
    page_object(:city, tag: :text_field) { {xpath: '//input[@name="ShipCity"]'} }
    page_object(:province, tag: :text_field) { {xpath: '//input[@name="ShipState"]'} }
    page_object(:postal_code, tag: :text_field) { {xpath: '//input[@name="ShipPostalCode"]'} }
    page_object(:phone, tag: :text_field) { {xpath: '(//input[@name="ShipPhone"])[2]'} }
    page_object(:email, tag: :text_field) { {xpath: '(//input[@name="BuyerEmail"])[2]'} }
    page_object(:show_less) { {xpath: '//div[contains(@id, "international")]//span[text()="Less"]'} }

    page_object(:customs_form) { {xpath: '//*[contains(@class, "customs-btn-container")]//*[text()="Customs Form..."]'} }
    page_object(:restrictions) { {xpath: ''} }
    page_object(:reference_num) { {xpath: ''} }

    def country
      SdcShipToCountryIntl.new
    end
  end

  class SdcOrderDetailsShipTo < SdcPage
    page_object(:show_more) { {xpath: '//div[starts-with(@id, "shiptoview-addressCollapsed")]//a'} }

    def domestic
      SdcOrderDetailsDomestic.new
    end

    def international
      SdcOrderDetailsInternational.new
    end
  end

  class SdcOrderDetailsWeight < SdcPage
    text_field(:lbs_tf, tag: :text_field) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//input)[1]'} }
    page_object(:lbs_inc) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
    page_object(:lbs_dec) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
    sdc_number(:lbs, :lbs_tf, :lbs_inc, :lbs_dec)

    text_field(:oz_tf, tag: :text_field) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//input)[1]'} }
    page_object(:oz_inc) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
    page_object(:oz_dec) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
    sdc_number(:oz, :oz_tf, :oz_inc, :oz_dec)
  end

  class SdcOrderDetailsDimensions < SdcPage
    text_field(:len_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "lengthnumberfield")])[1]'} }
    page_object(:len_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
    page_object(:len_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
    sdc_number(:length, :len_tf, :len_inc, :len_dec)

    text_field(:wid_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "widthnumberfield")])[1]'} }
    page_object(:wid_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
    page_object(:wid_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
    sdc_number(:width, :wid_tf, :wid_inc, :wid_dec)

    text_field(:oz_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "heightnumberfield")])[1]'} }
    page_object(:oz_inc) { {xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
    page_object(:oz_dec) { {xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
    sdc_number(:height, :oz_tf, :oz_inc, :oz_dec)
  end

  class SdcOrderDetailsItem < SdcPage
    def qty(num)
      page_object("qty_tf#{num}", tag: :text_field) { { xpath: "(//*[@name='Quantity'])[#{num}]" } }
      page_object("qty_inc#{num}") {{xpath: "(//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'up')])[#{num}]"}}
      page_object("qty_dec#{num}") { { xpath: "(//*[@name='Quantity']/../following-sibling::*/div[contains(@class, 'down')])[#{num}]" } }
      sdc_number("qty#{num}", "qty_tf#{num}", "qty_inc#{num}", "qty_dec#{num}")
    end

    def id(num)
      page_object("id#{num}", tag: :text_field) { { xpath: "(//*[@name='SKU'])[#{num}]" } }
    end

    def description(num)
      page_object("description#{num}", tag: :text_field) { { xpath: "(//*[@name='Description'])[#{num}]" } }
    end

    def delete(num)
      page_object("delete#{num}") { { xpath: "(//span[contains(@class, 'remove')])[#{num}]" } }
    end
  end

  class SdcOrderDetails < SdcPage
    page_object(:title, required: true, timeout: 20) { {xpath: '//div[contains(@class, "singleorder-detailsform")]//label[contains(@class, "panel-header-text")]'} }
    page_object(:reference_num, required: true, timeout: 20) { {xpath: '//div[contains(@class, "reference-field-container")]//input'} }
    page_object(:service_label, required: true, timeout: 20) { {xpath: '(//*[contains(text(), "Service:")])[2]'} }
    page_object(:weight_label, required: true, timeout: 20) { {xpath: '//*[contains(text(), "Weight:")]'} }
    page_object(:ship_to_label, required: true, timeout: 20) { {xpath: '//div[starts-with(@id, "singleOrderDetailsForm")]//label[text()="Ship To:"]'} }
    page_object(:order_id, required: true, timeout: 20) { {xpath: '(//*[contains(@class, "singleorder-detailsform")]//div[contains(@class, "sdc-toolbar")]//b)[1]'} }
    page_object(:add_item) { {xpath: '//*[text()="Add Item"]'} }

    def ship_to
      SdcOrderDetailsShipTo.new
    end

    def ship_from
      SdcOrderDetailsShipFrom.new
    end

    def weight
      SdcOrderDetailsWeight.new
    end

    def service
      SdcOrderDetailsService.new
    end

    def insure_for
      SdcOrderDetailsInsurance.new
    end

    def tracking
      SdcOrderDetailsTracking.new
    end

    def footer
      SdcOrderDetailsFooter.new
    end

    def dimensions
      SdcOrderDetailsDimensions.new
    end

    def associated_item
      SdcOrderDetailsItem.new
    end
  end
end
