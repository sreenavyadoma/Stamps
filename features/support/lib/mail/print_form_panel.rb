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

      module EmailTracking
        def email_tracking
          cache[:email_tracking].nil? || !cache[:email_tracking].present? ? cache[:email_tracking] = PrintFormEmail.new(param) : cache[:email_tracking]
        end
      end

      module Weight
        def weight
          cache[:weight].nil? || !cache[:weight].present? ? cache[:weight] = PrintFormWeight.new(param) : cache[:weight]
        end
      end

      module Dimensions
        def dimensions
          cache[:dimensions].nil? || !cache[:dimensions].present? ? cache[:dimensions] = PrintFormDimensions.new(param) : cache[:dimensions]
        end
      end

      module Service
        def service
          cache[:service].nil? || !cache[:service].present? ? cache[:service] = PrintFormService.new(param) : cache[:service]
        end
      end

      module InsureFor
        def insure_for
          cache[:insure_for].nil? || !cache[:insure_for].present? ? cache[:insure_for] = PrintFormInsureFor.new(param) : cache[:insure_for]
        end
      end

      module Tracking
        def tracking
          cache[:tracking].nil? || !cache[:tracking].present? ? cache[:tracking] = PrintFormTracking.new(param) : cache[:tracking]
        end
      end

      module MailCustoms
        def mail_customs
          cache[:mail_customs].nil? || !cache[:mail_customs].present? ? cache[:mail_customs] = PrintFormCustoms.new(param) : cache[:mail_customs]
        end
      end

      ##
      # Mail Advanced Options
      module AdvancedOptions
        # @return [Mail Advanced Options]
        def advanced_options
          case param.print_media
          when :stamps
            if cache[:stamps_options].nil? || !cache[:stamps_options].present?
              cache[:stamps_options] = Class.new(Browser::Base).new(param).extend(Stamps::Mail::AdvancedOptions::Stamps)
            end
            return cache[:stamps_options]
          when :label
            if cache[:label_options].nil? || !cache[:label_options].present?
              cache[:label_options] = Class.new(Browser::Base).new(param).extend(Stamps::Mail::AdvancedOptions::Labels)
            end
            return cache[:label_options]
          when :envelope
            if cache[:envelope_options].nil? || !cache[:envelope_options].present?
              cache[:envelope_options] = Class.new(Browser::Base).new(param).extend(Stamps::Mail::AdvancedOptions::Envelopes)
            end
            return cache[:envelope_options]
          # when :certified_mail, :certified_mail_3910_3930, :certified_mail_3810, :certified_mail_3830
          when :cm3610, :cm3710, :cm3910, :cm3930, :cm3810, :cm3830
            if cache[:cm_options].nil? || !cache[:cm_options].present?
              cache[:cm_options] = Class.new(Browser::Base).new(param).extend(Stamps::Mail::AdvancedOptions::CertifiedMails)
            end
            return cache[:cm_options]
          when :roll
            if cache[:roll_options].nil? || !cache[:roll_options].present?
              cache[:roll_options] = Class.new(Browser::Base).new(param).extend(Stamps::Mail::AdvancedOptions::Rolls)
            end
            return cache[:roll_options]
          end

          raise ArgumentError, "Unable to create Advanced Options object for print media #{param.print_media}"
        end
      end

      module StampsPrintPreview
        def buy_more_labels
          @buy_more_labels = StampsField.new(browser.span(text: 'Buy More Labels')) if @buy_more_labels.nil? || !@buy_more_labels.present?
          expect(@buy_more_labels).to be_present
          @buy_more_labels
        end
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
            cache[:serial_number] = StampsTextbox.new(browser.text_field(css: '[id=sdc-mainpanel-nsserialtextfield-inputEl]'))
          end
          cache[:serial_number]
        end

        def stamp_amount
          if cache[:stamp_amount].nil? || !cache[:stamp_amount].present? then
            cache[:stamp_amount] = StampsNumberField.new(
                browser.text_field(css: '[class*=sdc-mainpanel-stampsamountnumberfield]'),
                browser.div(css: 'div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=up]'),
                browser.div(css: 'div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=down]'))
          else
            cache[:stamp_amount]
          end
        end

        def quantity
          if cache[:quantity].nil? || !cache[:quantity].present? then
            cache[:quantity] = StampsNumberField.new(
                browser.text_field(css: 'div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div>input[id^=numberfield]'),
                browser.div(css: 'div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=up]'),
                browser.div(css: 'div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=down]'))
          else
            cache[:quantity]
          end
        end
      end

      module ExtServCertMail
        def certified_mail
          if cache[:certified_mail].nil? || !cache[:certified_mail].present? then
            cache[:certified_mail] = Stamps::Browser::StampsCheckbox.new(
                browser.input(id: 'sdc-mainpanel-cmcheckbox-inputEl'),
                browser.div(id: 'sdc-mainpanel-cmcheckbox'),
                'class',
                'checked')
          end
          cache[:certified_mail]
        end
      end

      module ExtServElecRetReceipt
        def electronic_return_receipt
          if cache[:ereturn_receipt].nil? || !cache[:ereturn_receipt].present? then
            cache[:ereturn_receipt] = Stamps::Browser::StampsCheckbox.new(
                browser.span(id: 'sdc-mainpanel-rrecheckbox-displayEl'),
                browser.div(id: 'sdc-mainpanel-rrecheckbox'),
                'class',
                'checked')
          end
          cache[:ereturn_receipt]
        end
      end

      # module ExtServRestDelivery
      #   # def restricted_delivery
      #   #   if cache[:restricted_delivery].nil? || !cache[:restricted_delivery].present?
      #   #     cache[:restricted_delivery] = Stamps::Browser::StampsCheckbox.new(
      #   #         browser.span(css: 'span[class*=sdc-mainpanel-rdcheckbox]'),
      #   #         browser.div(css: 'div[id^=certifiedmailview]>div:nth-child(4)>div>div>div[class*=x-form-item]'),
      #   #         'class',
      #   #         'checked')
      #   #   end
      #   #   cache[:restricted_delivery]
      #   # end
      # end

      module ExtServRetReceipt
        def return_receipt
          if cache[:return_receipt].nil? || !cache[:return_receipt].present?
            cache[:return_receipt] = Stamps::Browser::StampsCheckbox.new(
                browser.span(id: 'sdc-mainpanel-rrcheckbox-displayEl'),        #can't check/uncheck
                #browser.span(css: 'span[id=sdc-mainpanel-rrcheckbox-displayEl]'),     #can't evaluate enabled/disabled
                browser.div(id: 'sdc-mainpanel-rrcheckbox'),
                'class',
                'checked')
          end
          cache[:return_receipt]
        end
      end

      module CertifiedMail
        include MailFrom
        include MailTo
        include EmailTracking
        include Weight
        include Service
        include MailCustoms
        include AdvancedOptions
        include Dimensions
        include PrintOnTextbox
        include PrintFormBlurOut
        include ExtServCertMail
        include ExtServElecRetReceipt
        include ExtServRetReceipt

        def present?
          print_on_textbox.text.include?('Certified Mail')
        end
      end

      # module CM3610
      #   include CertifiedMail
      # end
      #
      # module CM3710
      #   include CertifiedMail
      # end
      #
      # module CM3910
      #   include CertifiedMail
      # end
      #
      # module CM3930
      #   include CertifiedMail
      # end
      #
      # module CM3810
      #   include CertifiedMail
      #   include ExtServRetReceipt
      # end
      #
      # module CM3830
      #   include CertifiedMail
      #   include ExtServRetReceipt
      # end


      module Roll
        include MailFrom
        include MailTo
        include EmailTracking
        include Weight
        include Service
        include InsureFor
        include Tracking
        include MailCustoms
        include AdvancedOptions
        include Dimensions
        include PrintOnTextbox
        include PrintFormBlurOut

        def present?
          print_on_textbox.text.include?('Roll')
        end
      end

      module Envelope
        include MailFrom
        include MailTo
        include Weight
        include Service
        include InsureFor
        include Tracking
        include AdvancedOptions
        include PrintOnTextbox
        include PrintFormBlurOut

        def present?
          print_on_textbox.text.include?('Envelope')
        end

        def ship_date
          cache[:ship_date].nil? || !cache[:ship_date].present? ? cache[:ship_date] = ShipDate.new(param) : cache[:ship_date]
        end

        def form_view
          raise 'Not Implemented'
        end
      end

      module ShippingLabel
        include MailFrom
        include MailTo
        include Weight
        include EmailTracking
        include Service
        include InsureFor
        include Tracking
        include MailCustoms
        include AdvancedOptions
        include Dimensions
        include PrintOnTextbox
        include PrintFormBlurOut

        def present?
          print_on_textbox.text.include?('Shipping Label')
        end

        def mail_ship_date
          raise 'Not Implemented'
        end

        def form_view
          raise 'Not Implemented'
        end
      end
    end
  end
end
