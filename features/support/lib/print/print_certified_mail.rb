# encoding: utf-8
module Print
  module Postage
    class CertifiedMail < Print::Postage::PrintPostage
      def email_tracking
        Print::Postage::Email.new @browser
      end

      def weight
        Print::Postage::Weight.new @browser
      end

      def service
        Print::Postage::Service.new @browser
      end

      def insure_for
        Print::Postage::InsureFor.new @browser
      end

      def extra_services
        Print::Postage::ExtraServicesCM.new @browser
      end

      def ship_date
        Print::Postage::ShipDate.new @browser
      end

      class ExtraServicesCM < Print::Postage::PrintObject

        def cm_checkbox select

          checkbox_field = @browser.input :id => "sdc-mainpanel-cmcheckbox-inputEl"
          verify_field = @browser.table :id => "sdc-mainpanel-cmcheckbox"
          checkbox = Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"

          if select
            checkbox.check
            log.info checkbox.checked?
          else
            checkbox.uncheck
            log.info checkbox.checked?
          end

        end

        def err_checkbox select

          checkbox_field = @browser.input :id => "sdc-mainpanel-rrecheckbox-inputEl"
          verify_field = @browser.table :id => "sdc-mainpanel-rrecheckbox"
          checkbox = Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"

          if select
            checkbox.check
            log.info checkbox.checked?
          else
            checkbox.uncheck
            log.info checkbox.checked?
          end

        end

        def rd_checkbox select

          checkbox_field = @browser.input :css => "input[class*=sdc-mainpanel-rdcheckbox]"
          #verify_field = @browser.table :id => "sdc-mainpanel-rdcheckbox"
          checkbox = Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"

          if select
            checkbox.check
            log.info checkbox.checked?
          else
            checkbox.uncheck
            log.info checkbox.checked?
          end

        end
      end


    end
  end
end