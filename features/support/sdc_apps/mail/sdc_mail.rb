module SdcMail

  class << self
    attr_accessor :print_media

    def print_on
      SdcPrintOn.new
    end

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
  end

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
    @modals
  end
end
