module Stamps
  module Orders
    module SdcOrderDetailsComboBoxText
      def text
        text_field.text_value
      end
    end

    module SdcOrderDetailsCost
      def cost
        cost_elem.text_value.dollar_amount_str.to_f
      end
    end

    class SdcOrderDetailsShipFrom < SdcPageObject
      element(:drop_down) { {xpath: '(//div[starts-with(@id, "shipfromdroplist")]/div[contains(@id, "trigger-picker")])[1]'} }
      element(:text_field) { {xpath: '(//input[starts-with(@id, "shipfromdroplist")])[1]'} }

      def select(str)
        self.class.element(:selection_element) { {xpath: "//li[text()='#{str}']"} }
        5.times do
          drop_down.click unless selection_element.present?
          selection_element.safe_click
          return text_field.text if text_field.text_value == str
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
          return text_field.text if text_field.text_value == str
        end
      end
    end

    class SdcOrderDetailsService < SdcPageObject
      element(:cost) { {xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[6]//label[contains(@class, "details-form-label")])[2]'} }
      element(:drop_down) { {xpath: '(//div[contains(@id, "servicedroplist")]//div[contains(@id, "trigger-picker")])[1]'} }
      element(:text_field) { {xpath: '(//input[contains(@id, "servicedroplist")])[1]'} }

      def select(str)
        self.class.element(:selection_element) { {xpath: "//li[@id='#{data_for(:orders_services, {})[str]}']"} }
        5.times do
          drop_down.click unless selection_element.present?
          selection_element.safe_click
          # return text_field.text_value if text_field.text_value == str
          return text_field.text_value if text_field.text_value.include?(str)
        end
      end
    end

    class SdcOrderDetailsInsurance < SdcPageObject
      element(:cost) { {xpath: '(//div[contains(@id, "singleOrderDetailsForm")]//div[7]//label[contains(@class, "component")])[2]'} }

      element(:chooser_elem) { {xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//input[contains(@class, "checkbox")]'} }
      element(:verify_elem) { {xpath: '//div[contains(@id, "singleOrderDetailsForm")]//div[7]//div[contains(@class, "checkbox")]'} }
      checkbox(:checkbox, :chooser_elem, :verify_elem, "class", "checked")

      text_field(:text_f, tag_name: :text_field) { {xpath: '(//input[contains(@id, "insurancefield")])[1]'} }
      element(:increment) { {xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      element(:decrement) { {xpath: '(//div[contains(@id, "insurancefield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:amount, :text_f, :increment, :decrement)
    end

    class SdcOrderDetailsTracking < SdcPageObject
      element(:cost) { {xpath: '//*[contains(@class, "selected_tracking_cost")]'} }
      element(:drop_down) { {xpath: '(//div[contains(@id, "trackingdroplist")]//div[contains(@id, "trigger-picker")])[1]'} }
      element(:text_field) { {xpath: '(//input[contains(@id, "trackingdroplist")])[1]'} }

      def select(str)
        self.class.element(:selection_element) { {xpath: "//li//td[text()='#{str}']"} }
        5.times do
          drop_down.click unless selection_element.present?
          selection_element.safe_click
          return text_field.text if text_field.text_value == str
        end
      end
    end

    class SdcOrderDetailsFooter < SdcPageObject
      label(:total_ship_cost) { {xpath: '//label[contains(@class, "total_cost")]'} }
      button(:print) { {} }
    end

    class SdcOrderDetailsShipTo < SdcPageObject
      element(:address, tag_name: :textarea) { {xpath: '//textarea[contains(@id, "shiptotextarea")]'} }
      element(:phone) { {xpath: '(//input[@name="ShipPhone"])[1]'} }
      element(:email) { {xpath: '(//input[@name="BuyerEmail"])[1]'} }

      element(:show_more) { {xpath: '//div[starts-with(@id, "shiptoview-addressCollapsed")]//a'} }
      element(:show_less) { {xpath: '//div[starts-with(@id, "shiptoview-domestic")]//span[text()="Less"]'} }

      def country
        @country ||= SdcShipToCountry.new
      end
    end

    class SdcOrderDetailsWeight < SdcPageObject
      text_field(:lbs_tf, tag_name: :text_field) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//input)[1]'} }
      element(:lbs_inc) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      element(:lbs_dec) { {xpath: '(//div[contains(@class, "pounds-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:lbs, :lbs_tf, :lbs_inc, :lbs_dec)

      text_field(:oz_tf, tag_name: :text_field) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//input)[1]'} }
      element(:oz_inc) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-up")])[1]'} }
      element(:oz_dec) { {xpath: '(//div[contains(@class, "ounces-numberfield")]//div[contains(@class, "x-form-spinner-down")])[1]'} }
      number(:oz, :oz_tf, :oz_inc, :oz_dec)
    end


    class SdcOrderDetailsDimensions < SdcPageObject
      text_field(:len_tf, tag_name: :text_field) { {xpath: '(//*[contains(@class, "lengthnumberfield")])[1]'} }
      element(:len_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
      element(:len_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
      number(:length, :len_tf, :len_inc, :len_dec)

      text_field(:wid_tf, tag_name: :text_field) { {xpath: '(//*[contains(@class, "widthnumberfield")])[1]'} }
      element(:wid_inc) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
      element(:wid_dec) { {xpath: '(//*[contains(@class, "lengthnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
      number(:width, :wid_tf, :wid_inc, :wid_dec)

      text_field(:oz_tf, tag_name: :text_field) { {xpath: '(//*[contains(@class, "heightnumberfield")])[1]'} }
      element(:oz_inc) { {xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "up")])[1]'} }
      element(:oz_dec) { {xpath: '(//*[contains(@class, "heightnumberfield")]/../following-sibling::*/div[contains(@class, "down")])[1]'} }
      number(:height, :oz_tf, :oz_inc, :oz_dec)
    end

    class SdcOrderDetails < SdcPageObject
      element(:title) { {xpath: '//div[contains(@class, "singleorder-detailsform")]//label[contains(@class, "panel-header-text")]'} }
      element(:reference_num) { {xpath: '//div[contains(@class, "reference-field-container")]//input'} }
      element(:service_blur_out_field) { {xpath: '(//*[contains(text(), "Service:")])[2]'} }
      element(:weight_blur_out_field) { {xpath: '//*[contains(text(), "Weight:")]'} }

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

      #international
      #customs form

      def present?
        title.present?
      end

      def blur_out(count = 1)
        (count.nil? || count == 0 ? 1 : count.to_i).times do
          service_blur_out_field.safe_click
          weight_blur_out_field.safe_double_click
          weight_blur_out_field.safe_click
          service_blur_out_field.safe_double_click
        end
      end

      def wait_until_present(count=3)
        (count.nil? || count == 0 ? 1 : count.to_i).times do
          return title.text_value if title.present?
          sleep(1)
        end
      end
    end
  end
end