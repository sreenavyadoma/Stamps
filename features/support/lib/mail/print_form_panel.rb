module Stamps
  module Mail
    module PrintFormPanel
      module PrintFormBlurOut
        def blur_out_field
          (cache[:blur_out_field].nil?||!cache[:blur_out_field].present?)?cache[:blur_out_field]=StampsField.new(browser.label(text: 'Print On:')):cache[:blur_out_field]
        end

        def blur_out(count=2)
          expect(blur_out_field).to be_present, "Blur out field is not present."
          count.to_i.times do
            blur_out_field.double_click
            blur_out_field.flash
            blur_out_field.click
          end
        end
      end

      module MailFrom
        def mail_from
          (cache[:mail_from].nil?||!cache[:mail_from].present?)?cache[:mail_from]=PrintFormMailFrom.new(param):cache[:mail_from]
        end
      end

      module MailTo
        def mail_to
          (cache[:mail_to].nil?||!cache[:mail_to].present?)?cache[:mail_to]=PrintFormMailTo.new(param):cache[:mail_to]
        end
      end

      module MailWeight
        def mail_weight
          (cache[:mail_weight].nil?||!cache[:mail_weight].present?)?cache[:mail_weight]=PrintFormWeight.new(param):cache[:mail_weight]
        end
      end

      module MailDimensions
        def dimensions
          (cache[:dimensions].nil?||!cache[:dimensions].present?)?cache[:dimensions]=PrintFormDimensions.new(param):cache[:dimensions]
        end
      end

      module MailService
        def mail_service
          (cache[:mail_service].nil?||!cache[:mail_service].present?)?cache[:mail_service]=PrintFormService.new(param):cache[:mail_service]
        end
      end

      module MailCustoms
        def mail_customs
          (cache[:mail_customs].nil?||!cache[:mail_customs].present?)?cache[:mail_customs]=PrintFormCustoms.new(param):cache[:mail_customs]
        end
      end

      module MailAdvancedOptions
        def advanced_options
          case param.print_media
            when :stamps
              cache[:advanced_options]=AdvancedOptions::AdvancedOptionsContainer.new(param).extend(AdvancedOptions::StampsAdvancedOptions) if cache[:advanced_options].nil?||(cache[:advanced_options].print_media!=:stamps)
            when :labels
              cache[:advanced_options]=AdvancedOptions::AdvancedOptionsContainer.new(param).extend(AdvancedOptions::LabelsAdvancedOptions) if cache[:advanced_options].nil?||(cache[:advanced_options].print_media!=:labels)
            when :envelopes
              cache[:advanced_options]=AdvancedOptions::AdvancedOptionsContainer.new(param).extend(AdvancedOptions::EnvelopesAdvancedOptions) if cache[:advanced_options].nil?||(cache[:advanced_options].print_media!=:envelopes)
            when :certified_mails, :certified_mails_3910_3930, :certified_mails_3810, :certified_mails_3830
              cache[:advanced_options]=AdvancedOptions::AdvancedOptionsContainer.new(param).extend(AdvancedOptions::CertifiedMailsAdvancedOptions) if cache[:advanced_options].nil?||((cache[:advanced_options].print_media!=:certified_mails) && (cache[:advanced_options].print_media!=:certified_mails_3910_3930) && (cache[:advanced_options].print_media!=:certified_mails_3810) && (cache[:advanced_options].print_media!=:certified_mails_3830))
            when :rolls
              cache[:advanced_options]=AdvancedOptions::AdvancedOptionsContainer.new(param).extend(AdvancedOptions::RollsAdvancedOptions) if cache[:advanced_options].nil?||(cache[:advanced_options].print_media!=:rolls)
            else
              # do nothing
          end
          cache[:advanced_options]
        end
      end

      module MailStamps
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailAdvancedOptions

        def serial_number
          (cache[:serial_number].nil?||!cache[:serial_number].present?)?cache[:serial_number]=StampsTextbox.new(browser.text_field(id: "sdc-mainpanel-nsserialtextfield-inputEl")):cache[:serial_number]
        end

        def stamp_amount
          (cache[:stamp_amount].nil?||!cache[:stamp_amount].present?)?cache[:stamp_amount]=StampsNumberField.new(browser.text_field(css: "input[class*=sdc-mainpanel-stampsamountnumberfield]"),
                                                                                                                 browser.div(css: "div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=up]"),
                                                                                                                 browser.div(css: "div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=down]")):cache[:stamp_amount]
        end

        def quantity
          (cache[:quantity].nil?||!cache[:quantity].present?)?cache[:quantity]=StampsNumberField.new(browser.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div>input[id^=numberfield]"),
                                                                                                     browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=up]"),
                                                                                                     browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")):cache[:quantity]
        end
      end

      module CertifiedMails
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailCustoms
        include MailAdvancedOptions
        include MailDimensions

        def certified_mail
          (cache[:certified_mail].nil?||!cache[:certified_mail].present?)?cache[:certified_mail]=Stamps::Browser::StampsCheckbox.new(browser.input(id: "sdc-mainpanel-cmcheckbox-inputEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-cmcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked"):cache[:certified_mail]
        end

        def electronic_return_receipt
          (cache[:ereturn_receipt].nil?||!cache[:ereturn_receipt].present?)?cache[:ereturn_receipt]=Stamps::Browser::StampsCheckbox.new(browser.span(id: "sdc-mainpanel-rrecheckbox-displayEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrecheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked"):cache[:ereturn_receipt]
        end

      end

      module CertifiedMails3810
        def return_receipt
          (cache[:return_receipt].nil?||!cache[:return_receipt].present?)?cache[:return_receipt]=Stamps::Browser::StampsCheckbox.new(browser.input(id: "sdc-mainpanel-rrcheckbox-inputEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked"):cache[:return_receipt]
        end
      end

      module CertifiedMails3830
        def return_receipt
          (cache[:return_receipt].nil?||!cache[:return_receipt].present?)?cache[:return_receipt]=Stamps::Browser::StampsCheckbox.new(browser.input(id: "sdc-mainpanel-rrcheckbox-inputEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked"):cache[:return_receipt]
        end
      end

      module CertifiedMails39103930
        def return_receipt
          (cache[:return_receipt].nil?||!cache[:return_receipt].present?)?cache[:return_receipt]=Stamps::Browser::StampsCheckbox.new(browser.span(id: "sdc-mainpanel-rrcheckbox-displayEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked"):cache[:return_receipt]
        end
      end

      module Rolls
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailCustoms
        include MailAdvancedOptions
        include MailDimensions
      end

      module Envelopes
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailAdvancedOptions

        def ship_date
          (cache[:ship_date].nil?||!cache[:ship_date].present?)?cache[:ship_date]=ShipDate.new(param):cache[:ship_date]
        end

        def form_view
          raise "form_view is not yet implemented."
        end
      end

      module ShippingLabels
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailCustoms
        include MailAdvancedOptions
        include MailDimensions

        def mail_tracking
          (cache[:mail_tracking].nil?||!cache[:mail_tracking].present?)?cache[:ship_date]=MailTracking.new(param):cache[:mail_tracking]
        end

        def mail_ship_date
          raise "mail_ship_date"
        end

        def form_view
          raise "form_view is not yet implemented."
        end
      end

      class PrintForm < Browser::StampsModal
        include PrintFormBlurOut
        def initialize(param)
          super
          cache[:print_media]=param.print_media
        end

        def print_media
          cache[:print_media]
        end
      end
    end
  end
end
