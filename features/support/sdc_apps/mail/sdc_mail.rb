module SdcMail

  class SdcPrintOn < SdcPage
    class << self
      attr_accessor :print_media
    end

    page_object(:drop_down) { { xpath: '//*[starts-with(@id, "printmediadroplist-")][contains(@id, "-trigger-picker")]' } }
    page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="PrintMedia"]' } }
    page_objects(:selection_list) { { xpath: '//li[contains(@class, "x-boundlist-item")]' } }
    page_object(:label) { { xpath: '//label[(text()="Print On:")]' } }

    def selection(name, str)
      self.class.print_media = SdcPrintMediaHelper.to_sym(str)
      page_object(name) { { xpath: "//li[text()='#{str}']" } }
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
    case SdcPrintOn.print_media.to_s
    when /stamps/
      return SdcPrintForm::Stamps.new
    when /shipping_label/
      return SdcPrintForm::ShippingLabels.new
    when /envelope/
      return SdcPrintForm::Envelopes.new
    when /certified_mail/
      return SdcPrintForm::CertifiedMail.new
    when /roll/
      return SdcPrintForm::Rolls.new
    else
      # ignore
    end

    raise ArgumentError, "Invalid print media: #{SdcPrintOn.print_media}"
  end
  module_function :print_form

  def print_preview
    case SdcPrintOn.print_media.to_s
    when /stamps/
      return SdcPrintPreview::Stamps.new
    when /shipping_label/
      return SdcPrintPreview::ShippingLabels.new
    when /envelope/
      return SdcPrintPreview::Envelopes.new
    when /certified_mail/
      return SdcPrintPreview::CertifiedMail.new
    when /roll/
      return SdcPrintPreview::Rolls.new
    else
      # ignore
    end

    raise ArgumentError, "Invalid print media: #{SdcPrintOn.print_media}"
  end
  module_function :print_preview

  def mail_toolbar
    #@mail_toolbar ||= MailToolbar.new(param, print_media)
  end
  module_function :mail_toolbar

  def modals
    SdcMailFloatingModals
  end
  module_function :modals

  def toolbar
    SdcMailToolbar.new
  end
  module_function :toolbar
end
