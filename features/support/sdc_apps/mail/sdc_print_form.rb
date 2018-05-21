module SdcMail

  module SdcStampsPrintForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo

    # include Weight
    # include Service
    # include AdvancedOptions
    # include PrintOnTextbox
    # include StampsPrintPreview
    # include PrintFormBlurOut
    #
    # page_object(:serial_number) { { xpath: 'xxxxxxx' } }
    # sdc_number(:serial_number) { { xpath: 'xxxxxxx' } }
    # sdc_number(:quantity) { { xpath: 'xxxxxxx' } }

  end

  module SdcShippingLabelPrintForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo
    include SdcPrintFormEmailTracking

    # include MailFrom
    # include MailTo
    # include Weight
    # include Service
    # include InsureFor
    # include Tracking
    # include MailCustoms
    # include AdvancedOptions
    # include Dimensions
    # include PrintOnTextbox
    # include PrintFormBlurOut
    #
    # def present?
    #   print_on_textbox.text.include?('Shipping Label')
    # end
    #
    # def mail_ship_date
    #   raise 'Not Implemented'
    # end
    #
    # def form_view
    #   raise 'Not Implemented'
    # end
  end



  module SdcEnvelopePrintForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo

    # include Weight
    # include Service
    # include InsureFor
    # include Tracking
    # include AdvancedOptions
    # include PrintOnTextbox
    # include PrintFormBlurOut
    #
    # def present?
    #   print_on_textbox.text.include?('Envelope')
    # end
    #
    # def ship_date
    #   cache[:ship_date].nil? || !cache[:ship_date].present? ? cache[:ship_date] = ShipDate.new(param) : cache[:ship_date]
    # end
    #
    # def form_view
    #   raise 'Not Implemented'
    # end
  end

  module SdcCertifiedMailPrintForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo
    include SdcPrintFormEmailTracking

    # include Weight
    # include Service
    # include MailCustoms
    # include AdvancedOptions
    # include Dimensions
    # include PrintOnTextbox
    # include PrintFormBlurOut
    # include ExtServCertMail
    # include ExtServElecRetReceipt
    # include ExtServRetReceipt
    #
    # def present?
    #   print_on_textbox.text.include?('Certified Mail')
    # end
  end

  module SdcRollPrintForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo
    include SdcPrintFormEmailTracking

    # include Weight
    # include Service
    # include InsureFor
    # include Tracking
    # include MailCustoms
    # include AdvancedOptions
    # include Dimensions
    # include PrintOnTextbox
    # include PrintFormBlurOut
    #
    # def present?
    #   print_on_textbox.text.include?('Roll')
    # end
  end
end
