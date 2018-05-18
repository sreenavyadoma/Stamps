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
    case SdcPrintOn.print_media
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
  ##
  # Print Media helper
  module SdcPrintMediaHelper
    class << self
      # @param [PrintMediaStr] str
      def to_sym(str)
        unless @selected_hash
          @selected_hash = {}
          @selected_hash['Stamps'] = :stamps
          @selected_hash['Shipping Shipping Label - 8 ½" x 11" Paper'] = :shipping_label_8x11
          @selected_hash['Shipping Label - SDC-1200, 4 ¼" x 6 ¾"'] = :shipping_label_sdc_1200
          @selected_hash['Shipping Label - 5 ½" x 8 ½"'] = :shipping_label_5x8
          @selected_hash['Envelope - #10, 4 ⅛" x 9 ½"'] = :envelope_10
          @selected_hash['Envelope - #9, 3 ⅞" x 8 ⅞"'] = :envelope_9
          @selected_hash['Envelope - #A9, 5 ¾" x 8 ¾"'] = :envelope_a9
          @selected_hash['Envelope - #6, 3 ⅝" x 6 ½"'] = :envelope_6
          @selected_hash['Envelope - #A2, 4 ⅜" x 5 ¾"'] = :envelope_a2
          @selected_hash['Envelope - #7, 3 ⅞" x 7 ½"'] = :envelope_7
          @selected_hash['Envelope - #11, 4 ½" x 10 ⅜"'] = :envelope_11
          @selected_hash['Envelope - #12, 4 ¾" x 11"'] = :envelope_12
          @selected_hash['Certified Mail Label - SDC-3610'] = :certified_mail_sdc_3610
          @selected_hash['Certified Mail Label - SDC-3710'] = :certified_mail_sdc_3710
          @selected_hash['Certified Mail Label - SDC-3910'] = :certified_mail_sdc_3910
          @selected_hash['Certified Mail Label - SDC-3930'] = :certified_mail_sdc_3930
          @selected_hash['Certified Mail #11 Envelope - SDC-3810'] = :certified_mail_sdc_3810
          @selected_hash['Roll - 4" x 6" Shipping Label'] = :roll_4x6
          @selected_hash['Roll - 4 ⅛" x 6 ¼" Shipping Label'] = :roll_4_18x6_34
          @selected_hash
        end
        @selected_hash[str]
      end
    end
  end
end
