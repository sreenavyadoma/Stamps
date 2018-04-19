module Stamps
  module SdcOrders
    class SdcOrderDetailsShipFrom < SdcPage
      page_obj(:drop_down) { {xpath: '(//div[starts-with(@id, "shipfromdroplist")]/div[contains(@id, "trigger-picker")])[1]'} }
      page_obj(:text_field) { {xpath: '(//input[starts-with(@id, "shipfromdroplist")])[1]'} }
    end

    class SdcShipToCountryDom < SdcPage
      page_obj(:drop_down) { {xpath: '//div[contains(@id, "matltocountrydroplist-trigger-picker")]'} }
      page_obj(:text_field) { {xpath: '//input[contains(@id, "matltocountrydroplist")]'} }

      def selection_obj(str)
        self.class.page_obj(:selection_element) { {xpath: "//li[text()='#{str}']"} }
      end
    end

    class SdcShipToCountryIntl < SdcPage
      page_obj(:drop_down) { {xpath: '(//*[contains(@id, "international")]//*[contains(@id, "picker")])[1]'} }
      page_obj(:text_field) { {xpath: '//div[contains(@id, "shiptoview-international")]//input[contains(@id, "combo")]'} }

      def selection(str)
        self.class.page_obj(:selection_element) { {xpath: "//li[text()='#{str}']"} }

      end
    end

    class SdcOrderDetailsService < SdcPage
      page_obj(:cost) { {xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[6]//label[contains(@class, "details-form-label")])[2]'} }
      page_obj(:drop_down) { {xpath: '(//div[contains(@id, "servicedroplist")]//div[contains(@id, "trigger-picker")])[1]'} }
      page_obj(:text_field) { {xpath: '(//input[contains(@id, "servicedroplist")])[1]'} }
    end

    class SdcOrderDetailsInsurance < SdcPage
      page_obj(:cost) { {xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[7]//label[contains(@class, "component")])[2]'} }

      page_obj(:chooser_elem) { {xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//input[contains(@class, "checkbox")]'} }
      page_obj(:verify_elem) { {xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//div[contains(@class, "checkbox")]'} }
      checkbox(:checkbox, :chooser_elem, :verify_elem, "class", "checked")

      text_field(:text_f, tag: :text_field) { {xpath: '(//input[contains(@id, "insurancefield")])[1]'} }
      page_obj(:increment) { {xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      page_obj(:decrement) { {xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:amount, :text_f, :increment, :decrement)
    end

    class SdcOrderDetailsTracking < SdcPage
      page_obj(:cost) { {xpath: '//*[contains(@class, "selected_tracking_cost")]'} }
      page_obj(:drop_down) { {xpath: '(//div[contains(@id, "trackingdroplist")]//div[contains(@id, "trigger-picker")])[1]'} }
      page_obj(:text_field) { {xpath: '(//input[contains(@id, "trackingdroplist")])[1]'} }
    end

    class SdcOrderDetailsFooter < SdcPage
      label(:total_ship_cost) { {xpath: '//label[contains(@class, "total_cost")]'} }
      button(:print) { {xpath: '(//div[contains(@class, "footer")]//span[text()="Print"])[1]'} }
    end

    class SdcOrderDetailsDomestic < SdcPage
      page_obj(:phone, tag: :text_field) { {xpath: '(//input[@name="ShipPhone"])[1]'} }
      page_obj(:email, tag: :text_field) { {xpath: '(//input[@name="BuyerEmail"])[1]'} }
      page_obj(:address, tag: :textarea) { {xpath: '//textarea[contains(@id, "shiptotextarea")]'} }
      page_obj(:show_less) { {xpath: '//div[contains(@id, "domestic")]//span[text()="Less"]'} }

      def country
        @country ||= SdcShipToCountryDom.new
      end
    end

    class SdcOrderDetailsInternational < SdcPage
      page_obj(:name, tag: :text_field) { {xpath: '//input[@name="ShipName"]'} }
      page_obj(:company, tag: :text_field) { {xpath: '//input[@name="ShipCompany"]'} }
      page_obj(:address1, tag: :text_field) { {xpath: '//input[@name="ShipStreet1"]'} }
      page_obj(:address2, tag: :text_field) { {xpath: '//input[@name="ShipStreet2"]'} }
      page_obj(:city, tag: :text_field) { {xpath: '//input[@name="ShipCity"]'} }
      page_obj(:province, tag: :text_field) { {xpath: '//input[@name="ShipState"]'} }
      page_obj(:postal_code, tag: :text_field) { {xpath: '//input[@name="ShipPostalCode"]'} }
      page_obj(:phone, tag: :text_field) { {xpath: '(//input[@name="ShipPhone"])[2]'} }
      page_obj(:email, tag: :text_field) { {xpath: '(//input[@name="BuyerEmail"])[2]'} }
      page_obj(:show_less) { {xpath: '//div[contains(@id, "international")]//span[text()="Less"]'} }

      def country
        @country ||= SdcShipToCountryIntl.new
      end
    end

    class SdcOrderDetailsShipTo < SdcPage
      page_obj(:show_more) { {xpath: '//div[starts-with(@id, "shiptoview-addressCollapsed")]//a'} }

      def domestic
        @domestic ||= SdcOrderDetailsDomestic.new
      end

      def international
        @international ||= SdcOrderDetailsInternational.new
      end
    end

    class SdcOrderDetailsWeight < SdcPage
      text_field(:lbs_tf, tag: :text_field) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//input)[1]'} }
      page_obj(:lbs_inc) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      page_obj(:lbs_dec) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:lbs, :lbs_tf, :lbs_inc, :lbs_dec)

      text_field(:oz_tf, tag: :text_field) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//input)[1]'} }
      page_obj(:oz_inc) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      page_obj(:oz_dec) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:oz, :oz_tf, :oz_inc, :oz_dec)
    end

    class SdcOrderDetailsDimensions < SdcPage
      text_field(:len_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "lengthnumberfield")])[1]'} }
      page_obj(:len_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
      page_obj(:len_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
      number(:length, :len_tf, :len_inc, :len_dec)

      text_field(:wid_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "widthnumberfield")])[1]'} }
      page_obj(:wid_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
      page_obj(:wid_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
      number(:width, :wid_tf, :wid_inc, :wid_dec)

      text_field(:oz_tf, tag: :text_field) { {xpath: '(//*[contains(@class, "heightnumberfield")])[1]'} }
      page_obj(:oz_inc) { {xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
      page_obj(:oz_dec) { {xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
      number(:height, :oz_tf, :oz_inc, :oz_dec)
    end

    class SdcOrderDetails < SdcPage
      page_obj(:title) { {xpath: '//div[contains(@class, "singleorder-detailsform")]//label[contains(@class, "panel-header-text")]'} }
      page_obj(:reference_num) { {xpath: '//div[contains(@class, "reference-field-container")]//input'} }
      page_obj(:service_blur_out_field) { {xpath: '(//*[contains(text(), "Service:")])[2]'} }
      page_obj(:weight_blur_out_field) { {xpath: '//*[contains(text(), "Weight:")]'} }

      def ship_to
        @ship_to ||= SdcOrderDetailsShipTo.new
      end

      def ship_from
        @ship_from ||= SdcOrderDetailsShipFrom.new
      end

      def weight
        @wieght ||= SdcOrderDetailsWeight.new
      end

      def service
        @service ||= SdcOrderDetailsService.new
      end

      def insurance
        @insurance ||= SdcOrderDetailsInsurance.new
      end

      def tracking
        @tracking ||= SdcOrderDetailsTracking.new
      end

      def footer
        @footer ||= SdcOrderDetailsFooter.new
      end

      def dimensions
        @dimensions ||= SdcOrderDetailsDimensions.new
      end
    end
  end
end