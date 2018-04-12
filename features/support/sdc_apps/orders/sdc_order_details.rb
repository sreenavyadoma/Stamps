module Stamps
  module Orders
    class SdcOrderDetailsShipFrom < SdcPageObject
      element(:drop_down) { {xpath: '(//div[starts-with(@id, "shipfromdroplist")]/div[contains(@id, "trigger-picker")])[1]'} }
      element(:text_field) { {xpath: '(//input[starts-with(@id, "shipfromdroplist")])[1]'} }

      def select(str)
        self.class.element(:selection_element) { {xpath: "//li[text()='#{str}']"} }
        5.times do
          drop_down.click unless selection_element.present?
          selection_element.safe_click
          return text_field.text if text_field.text == str
        end
      end
    end

    class SdcShipToCountry < SdcPageObject
      element(:drop_down) { {xpath: '//div[contains(@id, "matltocountrydroplist-trigger-picker")]'} }
      element(:text_field) { {xpath: '(//input[contains(@id, "matltocountrydroplist")])[1]'} }

      def select(str)
        self.class.element(:selection_element) { {xpath: "//li[text()='#{str}']"} }
        5.times do
          drop_down.click unless selection_element.present?
          selection_element.safe_click
          return text_field.text if text_field.text == str
        end
      end
    end

    class SdcShipTo < SdcPageObject
      element(:address) { {xpath: '//textarea[contains(@id, "shiptotextarea")]'} }
      element(:phone) { {xpath: '(//input[@name="ShipPhone"])[1]'} }
      element(:email) { {xpath: '(//input[@name="BuyerEmail"])[1]'} }

      element(:show_more) { {xpath: '//div[starts-with(@id, "shiptoview-addressCollapsed")]//a'} }
      element(:show_less) { {xpath: '//div[starts-with(@id, "shiptoview-domestic")]//span[text()="Less"]'} }

      def country
        @country ||= SdcShipToCountry
      end
    end

    class SdcOrderDetails < SdcPageObject
      element(:title) { {xpath: '//div[contains(@class, "singleorder-detailsform")]//label[contains(@class, "panel-header-text")]'} }

      element(:ship_from) { {xpath: ''} }

      text_field(:lbs_tf, tag_name: :text_field) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//input)[1]'} }
      element(:lbs_inc) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      element(:lbs_dec) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:lbs, :lbs_tf, :lbs_inc, :lbs_dec)

      text_field(:oz_tf, tag_name: :text_field) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//input)[1]'} }
      element(:oz_inc) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      element(:oz_dec) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:oz, :oz_tf, :oz_inc, :oz_dec)


      element(:reference_num) { {xpath: '//div[contains(@class, "reference-field-container")]//input'} }

      def ship_to
        @ship_to ||= SdcShipTo.new
      end

      def ship_from
        @ship_from ||= SdcOrderDetailsShipFrom.new
      end

      def present?
        title.present?
      end
    end
  end
end