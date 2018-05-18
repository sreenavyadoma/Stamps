module SdcMail

  class SdcStamps < SdcPage
    # include MailFrom
    # include MailTo
    # include Weight
    # include Service
    # include AdvancedOptions
    # include PrintOnTextbox
    # include StampsPrintPreview
    # include PrintFormBlurOut

    page_object(:search_results) { {xpath: ''} }

    page_object(:chooser) { {xpath: ''} }
    page_object(:verify) { {xpath: ''} }
    chooser(:result_checkbox, :chooser, :verify,'class', 'selected' )

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

  def verifying_account_info
    klass = Class.new(SdcPage) do
      page_object(:verifying_account_info) { {xpath: '//*[contains(text(), "Verifying")]'} }
    end

    klass.new.verifying_account_info
  end
  module_function :verifying_account_info

  def print_on
    SdcPrintOn.new
  end
  module_function :print_on

  def print_form
    case SdcPrintOn.media
    when :stamps
      @stamps ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::MailStamps)
      @stamps.print_media = print_media #todo-Rob Fix print_media
      return @stamps
    when :label
      @label ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::ShippingLabel)
      @label.print_media = print_media
      return @label
    when :envelope
      @envelope ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::Envelope)
      @envelope.print_media = print_media
      return @envelope
    when :certified_mail
      @certified_mail ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::CertifiedMail)
      @certified_mail.print_media = print_media
      return @certified_mail
    when :roll
      @roll ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::Roll)
      @roll.print_media = print_media
      return @roll
    when :manage_printing_options
      raise 'Not Implemented'
    else
      # ignore
    end

    raise ArgumentError, "Invalid print media: #{print_media}"
  end
  module_function :print_form

  # print preview should be part of print
  def print_preview
    @print_preview ||= PrintPreviewPanel::PrintPreview.new(param).extend(PrintPreviewPanel::StampsPrintPreview)
  end

  def mail_toolbar
    @mail_toolbar ||= MailToolbar.new(param, print_media)
  end

  def mail_external_sites
    @mail_external_sites ||= MailExternalSites.new(param)
  end

  def print_media_obj
  end

  def modals
    SdcMailFloatingModals
  end
  module_function :modals
end
