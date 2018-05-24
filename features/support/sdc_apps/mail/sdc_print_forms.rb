module SdcMail
  module SdcPrintForm
    module MailFromContainer
      class MailFrom < SdcPage
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-shipfromdroplist-trigger-picker"]' } }
        page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="ShipFrom"]' } }

        def selection(name, str)
          page_object(name) { { xpath: "//li[text()='#{str}']" } }
        end
      end

      def mail_from
        MailFrom.new
      end
    end

    module MailToContainer
      class MailTo < SdcPage
        # Mail To Drop down
        page_object(:dom_drop_down) { { xpath: '//*[@id="sdc-mainpanel-matltocountrydroplist-trigger-picker"]' } }
        page_object(:int_drop_down) { { xpath: '//*[@id="shiptoview-international-targetEl"]//div[contains(@id, "-trigger-picker")][starts-with(@id, "combo")]' } }
        page_objects(:dom_text_field, index: 0, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
        page_objects(:int_text_field, index: 1, tag: :text_fields) { { xpath: '//input[@name="ShipCountryCode"]' } }
        # Mail To link
        page_object(:link, tag: :u) { { xpath: '//label[contains(@class, "sdc-mainpanel-shiptolinkbtn")]//u' } }
        # Domestic Address
        page_object(:text_area, tag: :textarea) { { xpath: '//textarea[@name="freeFormAddress"]' } }
        # International Address
        page_object(:name, tag: :text_field) { { xpath: '//input[@name="ShipName"]' } }
        page_object(:company, tag: :text_field) { { xpath: '//input[@name="ShipCompany"]' } }
        page_object(:address_1, tag: :text_field) { { xpath: '//input[@name="ShipStreet1"]' } }
        page_object(:address_2, tag: :text_field) { { xpath: '//input[@name="ShipStreet2"]' } }
        page_object(:city, tag: :text_field) { { xpath: '//input[@name="ShipCity"]' } }
        page_object(:province, tag: :text_field) { { xpath: '//input[@name="ShipState"]' } }
        page_object(:postal_code, tag: :text_field) { { xpath: '//input[@name="ShipPostalCode"]' } }
        page_object(:phone, tag: :text_field) { { xpath: '//input[@name="ShipPhone"]' } }

        def selection(name, str)
          page_object(name) { { xpath: "//li[text()='#{str}']" } }
        end
      end

      def mail_to
        MailTo.new
      end
    end

    module EmailTrackingContainer
      class EmailTracking < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-emailtextfield-webpostage-inputEl"]' } }
        page_object(:chooser) { { xpath: '(//*[@id="appMainBodyContent-targetEl"]//div[starts-with(@id, "checkbox-")][contains(@id, "-innerWrapEl")]//input)[0]' } }
        page_object(:verify) { { xpath: '(//div[@class="x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-hbox-form-item x-form-item-no-label x-form-cb-checked x-form-dirty"])[0]' } }
        chooser(:checkbox, :chooser, :verify, :class, :checked)
      end

      def email_tracking
        EmailTracking.new
      end
    end

    module ExtraServicesContainer
      class ExtraServices < SdcPage
        page_object(:button) { { xpath: '//*[@id="sdc-mainpanel-extraservicesbtn-btnInnerEl"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-extraservicespricelabel"]' } }
      end

      def extra_services
        ExtraServices.new
      end
    end

    module WeightContainer
      class Weight < SdcPage
        text_field(:lbs_text_field, tag: :text_field) { { xpath: '//*[@name="WeightLbs"]' } }
        page_object(:lbs_increment) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"up")]' } }
        page_object(:lbs_decrement) { { xpath: '//*[contains(@class,"pounds")]//*[contains(@class,"down")]' } }
        sdc_number(:lbs, :lbs_text_field, :lbs_increment, :lbs_decrement)

        text_field(:oz_text_field, tag: :text_field) { { xpath: '//*[@name="WeightOz"]' } }
        page_object(:oz_increment) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"up")]' } }
        page_object(:oz_decrement) { { xpath: '//*[contains(@class,"ounces")]//*[contains(@class,"down")]' } }
        sdc_number(:oz, :oz_text_field, :oz_increment, :oz_decrement)

        page_object(:weigh) { { xpath: '//span[contains(text(), "Weigh")]' } }

        page_object(:auto) { { xpath: '//*[contains(@class,"autoweight-checkbox")]//input' } }
      end

      def weight
        Weight.new
      end
    end

    module ServiceContainer
      class Service < SdcPage
        text_field(:text_field, tag: :text_field) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-inputEl"]' } }
        page_object(:drop_down) { { xpath: '//*[@id="sdc-mainpanel-servicedroplist-trigger-picker"]' } }
        page_object(:cost) { { xpath: '//*[@id="sdc-mainpanel-servicepricelabel"]' } }

        def service_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-text']" } }
        end

        def inline_cost_element(name, str)
          page_object(name) { { xpath: "//*[@id='#{data_for(:mail_services, {})[str]}']//td[@class='x-boundlist-item-amount']" } }
        end
      end

      def service
        Service.new
      end
    end

    class PrintFormBase < SdcPage
      include WeightContainer
      include MailFromContainer
      include MailToContainer
      include MailToContainer
      include ServiceContainer

      page_object(:show_advanced_options) { { xpath: '//*[text()="Show Advanced Options"]' } }
      page_object(:hide_advanced_options) { { xpath: '//*[text()="Hide Advanced Options"]' } }
    end

    class Stamps < PrintFormBase
      include ExtraServicesContainer

      page_object(:serial_number, tag: :text_field) { { xpath: '//*[@name="NsSerial"]' } }

      page_object(:calc_chooser) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio-displayEl"]' } }
      page_object(:calc_verify) { { xpath: '//*[@id="sdc-mainpanel-calculatepostageradio"]' } }
      chooser(:calculate_postage_amount, :del_chooser, :ret_verify,
              :class, :checked)

      page_object(:spec_chooser) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio-displayEl"]' } }
      page_object(:spc_verify) { { xpath: '//*[@id="sdc-mainpanel-specifypostageradio"]' } }
      chooser(:specify_postage_amount, :del_chooser, :ret_verify,
              :class, :checked)

      text_field(:qty_text_field, tag: :text_field) { { xpath: '//*[@name="NsQuantity"]' } }
      page_object(:qty_increment) { { xpath: '//*[contains(@id,"printPreviewPanel-")]//*[contains(@class,"up")]' } }
      page_object(:qty_decrement) { { xpath: '//*[contains(@id,"printPreviewPanel-")]//*[contains(@class,"down")]' } }
      sdc_number(:quantity, :qty_text_field, :qty_increment, :qty_decrement)
    end

    class ShippingLabels < PrintFormBase
      include EmailTrackingContainer
      include ExtraServicesContainer

    end

    class Envelopes < PrintFormBase
      include ExtraServicesContainer

    end

    class CertifiedMail < PrintFormBase
      include EmailTrackingContainer

    end

    class Rolls < PrintFormBase
      include EmailTrackingContainer
      include ExtraServicesContainer

    end
  end
end
