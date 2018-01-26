module Stamps
  module Mail
    module PrintFormPanel
      module MailFrom
        def mail_from
          cache[:mail_from].nil? || !cache[:mail_from].present? ? cache[:mail_from] = PrintFormMailFrom.new(param) : cache[:mail_from]
        end
      end

      module MailTo
        def mail_to
          cache[:mail_to].nil? || !cache[:mail_to].present? ? cache[:mail_to] = PrintFormMailTo.new(param) : cache[:mail_to]
        end
      end

      module MailEmail
        def mail_email
          cache[:mail_email].nil? || !cache[:mail_email].present? ? cache[:mail_email] = PrintFormEmail.new(param) : cache[:mail_email]
        end
      end

      module MailWeight
        def mail_weight
          cache[:mail_weight].nil? || !cache[:mail_weight].present? ? cache[:mail_weight] = PrintFormWeight.new(param) : cache[:mail_weight]
        end
      end

      module MailDimensions
        def dimensions
          cache[:dimensions].nil? || !cache[:dimensions].present? ? cache[:dimensions] = PrintFormDimensions.new(param) : cache[:dimensions]
        end
      end

      module MailService
        def mail_service
          cache[:mail_service].nil? || !cache[:mail_service].present? ? cache[:mail_service] = PrintFormService.new(param) : cache[:mail_service]
        end
      end

      module MailInsureFor
        def mail_insure_for
          cache[:mail_insure_for].nil? || !cache[:mail_insure_for].present? ? cache[:mail_insure_for] = PrintFormInsureFor.new(param) : cache[:mail_insure_for]
        end
      end

      module MailTracking
        def mail_tracking
          cache[:mail_tracking].nil? || !cache[:mail_tracking].present? ? cache[:mail_tracking] = PrintFormTracking.new(param) : cache[:mail_tracking]
        end
      end

      module MailCustoms
        def mail_customs
          cache[:mail_customs].nil? || !cache[:mail_customs].present? ? cache[:mail_customs] = PrintFormCustoms.new(param) : cache[:mail_customs]
        end
      end

      ##
      # Mail Advanced Options
      module MailAdvancedOptions
        # @return [Mail Advanced Options]
        def advanced_options
          case param.print_media
          when :stamps
            if cache[:stamps_options].nil? || !cache[:stamps_options].present?
              cache[:stamps_options] = Stamps::Mail::AdvancedOptions::Form.class.assign({}).extend(AdvancedOptions::StampsAdvancedOptions)
            end
            return cache[:stamps_options]
          when :label
            if cache[:label_options].nil? || !cache[:label_options].present?
              cache[:label_options] = Stamps::Mail::AdvancedOptions::Form.new(param).extend(AdvancedOptions::LabelsAdvancedOptions)
            end
            return cache[:label_options]
          when :envelope
            if cache[:envelope_options].nil? || !cache[:envelope_options].present?
              cache[:envelope_options] = Stamps::Mail::AdvancedOptions::Form.new(param).extend(AdvancedOptions::EnvelopesAdvancedOptions)
            end
            return cache[:envelope_options]
          when :certified_mail, :certified_mail_3910_3930, :certified_mail_3810, :certified_mail_3830
            if cache[:cm_options].nil? || !cache[:cm_options].present?
              cache[:cm_options] = Stamps::Mail::AdvancedOptions::Form.new(param).extend(AdvancedOptions::CertifiedMailsAdvancedOptions)
            end
            return cache[:cm_options]
          when :roll
            if cache[:roll_options].nil? || !cache[:roll_options].present?
              cache[:roll_options] = Stamps::Mail::AdvancedOptions::Form.new(param).extend(AdvancedOptions::RollsAdvancedOptions)
            end
            return cache[:roll_options]
          end

          raise ArgumentError, "Unable to create Advanced Options object for print media #{param.print_media}"
        end
      end

      module StampsPrintPreview
        def buy_more_labels
          @buy_more_labels = StampsField.new(browser.span(text: "Buy More Labels")) if @buy_more_labels.nil? || !@buy_more_labels.present?
          expect(@buy_more_labels).to be_present
          @buy_more_labels
        end
      end

      module MailStamps
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailAdvancedOptions
        include PrintOnTextbox
        include StampsPrintPreview
        include PrintFormBlurOut

        def present?
          print_on_textbox.text.include?('Stamps')
        end

        def serial_number
          if (cache[:serial_number].nil? || !cache[:serial_number].present?)
            cache[:serial_number] = StampsTextbox.new(browser.text_field(id: "sdc-mainpanel-nsserialtextfield-inputEl"))
          end
          cache[:serial_number]
        end

        def stamp_amount
          cache[:stamp_amount].nil? || !cache[:stamp_amount].present? ? cache[:stamp_amount] = StampsNumberField.new(browser.text_field(css: "input[class*=sdc-mainpanel-stampsamountnumberfield]"),
                                                                                                                 browser.div(css: "div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=up]"),
                                                                                                                 browser.div(css: "div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=down]")) : cache[:stamp_amount]
        end

        def quantity
          cache[:quantity].nil? || !cache[:quantity].present? ? cache[:quantity] = StampsNumberField.new(browser.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div>input[id^=numberfield]"),
                                                                                                     browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=up]"),
                                                                                                     browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")) : cache[:quantity]
        end
      end

      module CertifiedMail
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailCustoms
        include MailAdvancedOptions
        include MailDimensions
        include PrintOnTextbox
        include PrintFormBlurOut

        def present?
          print_on_textbox.text.include?('Certified Mail')
        end

        def certified_mail
          cache[:certified_mail].nil? || !cache[:certified_mail].present? ? cache[:certified_mail] = Stamps::Browser::StampsCheckbox.new(browser.input(id: "sdc-mainpanel-cmcheckbox-inputEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-cmcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked") : cache[:certified_mail]
        end

        def electronic_return_receipt
          cache[:ereturn_receipt].nil? || !cache[:ereturn_receipt].present? ? cache[:ereturn_receipt] = Stamps::Browser::StampsCheckbox.new(browser.span(id: "sdc-mainpanel-rrecheckbox-displayEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrecheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked") : cache[:ereturn_receipt]
        end

      end

      module CertifiedMail3810
        def return_receipt
          cache[:return_receipt].nil? || !cache[:return_receipt].present? ? cache[:return_receipt] = Stamps::Browser::StampsCheckbox.new(browser.input(id: "sdc-mainpanel-rrcheckbox-inputEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked") : cache[:return_receipt]
        end
      end

      module CertifiedMail3830
        def return_receipt
          cache[:return_receipt].nil? || !cache[:return_receipt].present? ? cache[:return_receipt] = Stamps::Browser::StampsCheckbox.new(browser.input(id: "sdc-mainpanel-rrcheckbox-inputEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked") : cache[:return_receipt]
        end
      end

      module CertifiedMail39103930
        def return_receipt
          cache[:return_receipt].nil? || !cache[:return_receipt].present? ? cache[:return_receipt] = Stamps::Browser::StampsCheckbox.new(browser.span(id: "sdc-mainpanel-rrcheckbox-displayEl"),
                                                                                                                                     browser.div(id: "sdc-mainpanel-rrcheckbox"),
                                                                                                                                     "class",
                                                                                                                                     "checked") : cache[:return_receipt]
        end
      end

      module Roll
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailInsureFor
        include MailTracking
        include MailCustoms
        include MailAdvancedOptions
        include MailDimensions
        include PrintOnTextbox
        include PrintFormBlurOut

        def present?
          print_on_textbox.text.include?('Roll')
        end
      end

      module Envelope
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailInsureFor
        include MailTracking
        include MailAdvancedOptions
        include PrintOnTextbox
        include PrintFormBlurOut

        def present?
          print_on_textbox.text.include?('Envelope')
        end

        def ship_date
          cache[:ship_date].nil? || !cache[:ship_date].present? ? cache[:ship_date] = ShipDate.new(param) : cache[:ship_date]
        end

        def form_view
          raise "form_view is not yet implemented."
        end
      end

      module ShippingLabel
        include MailFrom
        include MailTo
        include MailWeight
        include MailEmail
        include MailService
        include MailInsureFor
        include MailTracking
        include MailCustoms
        include MailAdvancedOptions
        include MailDimensions
        include PrintOnTextbox

        def present?
          print_on_textbox.text.include?('Shipping Label')
        end

        def mail_ship_date
          raise "Not Implemented"
        end

        def form_view
          raise "Not Implemented"
        end
      end

      ##
      # print form
      class Form < BaseCache
        assign({})
      end
    end
  end
end
