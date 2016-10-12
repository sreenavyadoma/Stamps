# encoding: utf-8
module Stamps
  module Mail
    class ExtraServicesCM < Browser::Modal

      def cm_checkbox select

        checkbox_field = browser.text_field id: "sdc-mainpanel-cmcheckbox-inputEl"
        verify_field = browser.table id: "sdc-mainpanel-cmcheckbox"
        checkbox = Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"

        if select
          checkbox.check
          logger.info checkbox.checked?
        else
          checkbox.uncheck
          logger.info checkbox.checked?
        end

      end

      def err_checkbox select

        checkbox_field = browser.text_field id: "sdc-mainpanel-rrecheckbox-inputEl"
        verify_field = browser.table id: "sdc-mainpanel-rrecheckbox"
        checkbox = Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"

        if select
          checkbox.check
          logger.info checkbox.checked?
        else
          checkbox.uncheck
          logger.info checkbox.checked?
        end

      end

      def rd_checkbox select

        checkbox_field = browser.text_field css: "input[class*=sdc-mainpanel-rdcheckbox]"
        #verify_field = browser.table id: "sdc-mainpanel-rdcheckbox"
        checkbox = Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"

        if select
          checkbox.check
          logger.info checkbox.checked?
        else
          checkbox.uncheck
          logger.info checkbox.checked?
        end

      end
    end

    class CertifiedMail < MailForm
      def insure_for
        DetailsInsureFor.new param
      end

      def ship_date
        ShipDate.new param
      end
    end
  end
end