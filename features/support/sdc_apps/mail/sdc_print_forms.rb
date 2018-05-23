module SdcMail

  module SdcStampsForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo

    def advanced_options
      Object.const_get('SdcPage').new.extend(SdcAdvancedOptions::Stamps)
    end

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

  module SdcShippingLabelsForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo
    include SdcPrintFormEmailTracking

    def advanced_options
      Object.const_get('SdcPage').new.extend(SdcAdvancedOptions::ShippingLabels)
    end

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



  module SdcEnvelopesForm
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo

    def advanced_options
      Object.const_get('SdcPage').new.extend(SdcAdvancedOptions::Envelopes)
    end

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

  end
end
