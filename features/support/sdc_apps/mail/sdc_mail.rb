module SdcMail

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
    case SdcPrintOn.print_media.to_s
    when /stamps/
      return Object.const_get('SdcPage').new.extend(SdcStampsPrintForm)
    when /shipping_label/
      return Object.const_get('SdcPage').new.extend(SdcShippingLabelPrintForm)
    when /envelope/
      return Object.const_get('SdcPage').new.extend(SdcEnvelopePrintForm)
    when /certified_mail/
      return Object.const_get('SdcPage').new.extend(SdcCertifiedMailPrintForm)
    when /roll/
      return Object.const_get('SdcPage').new.extend(SdcRollPrintForm)
    else
      # ignore
    end

    raise ArgumentError, "Invalid print media: #{SdcPrintOn.print_media}"
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
