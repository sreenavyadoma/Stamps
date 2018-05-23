module SdcMail

  module SdcAdvancedOptions

    module AdvOptExtraServices

      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:extra_services, :chooser, :verify, 'class', 'checked')

      def xtra_serv_panel
        PrintFormPanel::MailExtraServices.new(param)
      end

      def value_must_be_shown
        PrintFormPanel::ValueMustBeShown.new(param)
      end

      def special_contents_warning
        PrintFormPanel::SpecialContentsWarning.new(param)
      end

    end

    module AdvOptReferenceNumber
      page_object(:reference_number) { { xpath: 'yyyyyyyyyyyyyy' } }
    end

    module AdvOptCostCode
      page_object(:cost_code) { { xpath: 'yyyyyyyyyyyyyy' } }
    end

    module AdvOptMailDate
      MailDate.new(param)
    end

    module AdvOptHideLabelValue
      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:hide_label_value, :chooser, :verify, 'class', 'checked')
    end

    module AdvOptPrintReferenceNumber
      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:print_reference_number, :chooser, :verify, 'class', 'checked')
    end

    module AdvOptPrintReceipt
      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:print_receipt, :chooser, :verify, 'class', 'checked')
    end

    module AdvOptToggle
      page_object(:show) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:hide) { { xpath: 'yyyyyyyyyyyyyy' } }
    end

    module Stamps
      include AdvOptToggle
      include AdvOptExtraServices
      include AdvOptReferenceNumber
      include AdvOptCostCode

      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:calculate_postage_amount, :chooser, :verify, 'class', 'checked')

      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:specify_postage_amount, :chooser, :verify, 'class', 'checked')

    end

    module ShippingLabels
      include AdvOptToggle
      include AdvOptExtraServices
      include AdvOptMailDate
      include AdvOptReferenceNumber
      include AdvOptCostCode
      include AdvOptHideLabelValue
      include AdvOptPrintReferenceNumber
      include AdvOptPrintReceipt
    end

    module Envelopes

      include AdvOptToggle
      include AdvOptExtraServices
      include AdvOptMailDate
      include AdvOptReferenceNumber
      include AdvOptCostCode

      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:return_address, :chooser, :verify, 'class', 'checked')

      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:delivery_address, :chooser, :verify, 'class', 'checked')

      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:postage, :chooser, :verify, 'class', 'checked')

    end

    module CertifiedMails
      include AdvOptToggle
      include AdvOptExtraServices
      include AdvOptMailDate
      include AdvOptReferenceNumber
      include AdvOptCostCode

      page_object(:chooser) { { xpath: 'yyyyyyyyyyyyyy' } }
      page_object(:verify) { { xpath: 'yyyyyyyyyyyyyy' } }
      chooser(:restricted_delivery, :chooser, :verify, 'class', 'checked')

    end

    module Rolls
      include AdvOptToggle
      include AdvOptExtraServices
      include AdvOptMailDate
      include AdvOptReferenceNumber
      include AdvOptCostCode
      include AdvOptHideLabelValue
      include AdvOptPrintReferenceNumber
      include AdvOptPrintReceipt

    end
  end
end