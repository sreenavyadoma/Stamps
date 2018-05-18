module SdcMail

  module SdcFormMailFrom
    def mail_from
      SdcMailFrom.new
    end
  end

  class SdcMailStamps
    include SdcFormMailFrom
    include MailTo
    include Weight
    include Service
    include AdvancedOptions
    include PrintOnTextbox
    include StampsPrintPreview
    include PrintFormBlurOut

    page_object(:serial_number) { {xpath: 'xxxxxxx'} }
    sdc_number(:serial_number) { {xpath: 'xxxxxxx'} }
    sdc_number(:quantity) { {xpath: 'xxxxxxx'} }

  end
end
