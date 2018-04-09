module Stamps
  module Orders
    class ShipTo < SdcPageObject
      element(:country) { {xpath: ''} }
      element(:address) { {xpath: ''} }
      element(:phone) { {xpath: ''} }
      element(:email) { {xpath: ''} }

      element(:show_more) { {xpath: '//div[starts-with(@id, "shiptoview-addressCollapsed")]//a'} }
      element(:show_less) { {xpath: '//div[starts-with(@id, "shiptoview-domestic")]//span[text()="Less"]'} }
    end

    class SdcOrderDetails < SdcPageObject
      element(:title) { {xpath: '//div[contains(@class, "singleorder-detailsform")]//label[contains(@class, "panel-header-text")]'} }

      #ship to

      element(:lbs_tf) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//input)[1]'} }
      element(:lbs_inc) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      element(:lbs_dec) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:lbs, :lbs_tf, :lbs_inc, :lbs_dec)

      element(:oz_tf) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//input)[1]'} }
      element(:oz_inc) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      element(:oz_dec) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:oz, :oz_tf, :oz_inc, :oz_dec)


      element(:reference_num) { {xpath: '//div[contains(@class, "reference-field-container")]//input'} }

      def ship_to
        @ship_to ||= SdcShipTo.new
      end

      def present?

      end
    end
  end
end