module SdcMail
  module SdcPrintFormLocators

  end

  module MailStamps
    include MailFrom
    include MailTo
    include Weight
    include Service
    include AdvancedOptions
    include PrintOnTextbox
    include StampsPrintPreview
    include PrintFormBlurOut

    def present?
      print_on_textbox.text.include?('Stamps')
    end

    def serial_number
      if (cache[:serial_number].nil? || !cache[:serial_number].present?)
        cache[:serial_number] = StampsTextbox.new(driver.text_field(css: '[id=sdc-mainpanel-nsserialtextfield-inputEl]'))
      end
      cache[:serial_number]
    end

    def stamp_amount
      if cache[:stamp_amount].nil? || !cache[:stamp_amount].present? then
        cache[:stamp_amount] = StampsNumberField.new(
            driver.text_field(css: '[class*=sdc-mainpanel-stampsamountnumberfield]'),
            driver.div(css: 'div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=up]'),
            driver.div(css: 'div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=down]'))
      else
        cache[:stamp_amount]
      end
    end

    def quantity
      if cache[:quantity].nil? || !cache[:quantity].present? then
        cache[:quantity] = StampsNumberField.new(
            driver.text_field(css: 'div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div>input[id^=numberfield]'),
            driver.div(css: 'div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=up]'),
            driver.div(css: 'div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=down]'))
      else
        cache[:quantity]
      end
    end
  end
end