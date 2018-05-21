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

  module ShippingLabel
    include SdcPrintFormMailFrom
    include SdcPrintFormMailTo
    include SdcPrintFormEmailTracking

    # include MailFrom
    # include MailTo
    # include Weight
    # include EmailTracking
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
end
