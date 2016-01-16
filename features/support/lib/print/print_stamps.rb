# encoding: utf-8
module Print
  module Postage
    class Stamps < PrintObject
      class CalculatePostageAmount < PrintObject
        def weight
          Print::Postage::Weight.new @browser
        end

        def extra_services
          Print::Postage::ExtraServices.new @browser
        end
      end

      class SpecifyPostageAmount < PrintObject
        def stamp_amount
          Print::Postage::StampAmount.new @browser
        end
      end

      def country
        Print::Postage::Country.new @browser
      end

      def serial
        Textbox.new @browser.text_field :id => "sdc-mainpanel-nsserialtextfield-inputEl"
      end

      def service
        Print::Postage::Service.new @browser
      end

      def ship_from
        Print::Print::Postage::ShipFrom.new @browser
      end

      def calculate_postage_amount
        checkbox = Checkbox.new (@browser.input :id => "sdc-mainpanel-calculatepostageradio-inputEl"), (@browser.table :id => "sdc-mainpanel-calculatepostageradio"), "class", "checked"
        checkbox.check
        CalculatePostageAmount.new @browser
      end

      def specify_postage_amount
        checkbox = Checkbox.new (@browser.input :id => "sdc-mainpanel-specifypostageradio-inputEl"), (@browser.table :id => "sdc-mainpanel-specifypostageradio"), "class", "checked"
        checkbox.check
        SpecifyPostageAmount.new @browser
      end

    end
  end
end
