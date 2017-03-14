module Stamps
  module Mail
    module PrintFormPanel
      module PrintFormBlurOut
        def blur_out
          @blur_out = StampsElement.new(browser.label(text: 'Print On:')) if @blur_out.nil? || !@blur_out.present?
          expect(@blur_out.present?).to be(true)
          3.times { @blur_out.safe_double_click }
        end
      end

      module MailFrom
        def mail_from
          @mail_from = PrintFormMailFrom.new(param) if @mail_from.nil? || !@mail_from.present?
          expect(@mail_from.present?).to be(true)
          @mail_from
        end
      end

      module MailTo
        def mail_to
          @mail_to = PrintFormMailTo.new(param) if @mail_to.nil? || !@mail_to.present?
          expect(@mail_to.present?).to be(true)
          @mail_to
        end
      end

      module MailWeight
        def mail_weight
          @mail_weight = PrintFormWeight.new(param) if @mail_weight.nil? || !@mail_weight.present?
          expect(@mail_weight.present?).to be(true)
          @mail_weight
        end
      end

      module MailService
        def mail_service
          @mail_service = PrintFormService.new(param) if @mail_service.nil? || !@mail_service.present?
          expect(@mail_service.present?).to be(true)
          @mail_service
        end
      end

      module MailCustoms
        def mail_customs
          @mail_customs = PrintFormCustoms.new(param) if @mail_customs.nil? || !@mail_customs.present?
          expect(@mail_customs.present?).to be(true)
          @mail_customs
        end
      end

      module MailAdvancedOptions
        def advanced_options
          case param.print_media
            when :stamps
              @advanced_options = AdvancedOptionsStamps.new(param) if @advanced_options.nil? || !@advanced_options.present?
            when :paper
              @advanced_options = AdvancedOptionsShippingLabel.new(param) if @advanced_options.nil? || !@advanced_options.present?
            when :envelopes
              @advanced_options = AdvancedOptionsEnvelope.new(param) if @advanced_options.nil? || !@advanced_options.present?
            when :certified_mail
              @advanced_options = AdvancedOptionsCertMail.new(param) if @advanced_options.nil? || !@advanced_options.present?
            when :rolls
              @advanced_options = AdvancedOptionsRolls.new(param) if @advanced_options.nil? || !@advanced_options.present?
            else
              # do nothing
          end
          @advanced_options
        end
      end

      module MailStamps
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailAdvancedOptions

        def serial_number
          @serial_number = StampsTextbox.new(browser.text_field(id: "sdc-mainpanel-nsserialtextfield-inputEl")) if @serial_number.nil? || !@serial_number.present?
          @serial_number
        end

        def stamp_amount
          if @stamp_amount.nil?
            text_box = browser.text_field(css: "input[class*=sdc-mainpanel-stampsamountnumberfield]")
            inc_btn = browser.div(css: "div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=up]")
            dec_btn = browser.divs(css: "div[id^=printFormPanel-][id$=-innerCt]>div>div>div>div:nth-child(17)>div>div>div>div>div>div[id*=trigger-spinner]>div[class*=down]")
            @stamp_amount = StampsNumberField.new(param, text_box, inc_btn, dec_btn)
          end
          @stamp_amount
        end

        def quantity
          if @quantity.nil?
            text_box = browser.text_field(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div>input[id^=numberfield]")
            inc_btn = browser.div(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=up]")
            dec_btn = browser.divs(css: "div[id^=printPreviewPanel-][id$=-innerCt]>div>div>div>div:nth-child(4)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")
            @quantity = StampsNumberField.new(param, text_box, inc_btn, dec_btn)
          end
          @quantity
        end
      end

      module CertifiedMail
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailCustoms
        include MailAdvancedOptions
      end

      module Rolls
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailCustoms
        include MailAdvancedOptions
      end

      module Envelopes
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailAdvancedOptions

        def ship_date
          ShipDate.new(param)
        end

        def form_view
          EnvelopeFormView.new(param)
        end
      end

      module ShippingLabels
        include MailFrom
        include MailTo
        include MailWeight
        include MailService
        include MailCustoms
        include MailAdvancedOptions

        def mail_tracking
          @mail_tracking = MailTracking.new(param) if @mail_insure_for.nil? || !@mail_insure_for.present?
          expect(@mail_insure_for.present?).to be(true)
          @mail_insure_for
        end

        def mail_ship_date
          @mail_ship_date = ShipDate.new(param) if @mail_ship_date.nil? || !@mail_ship_date.present?
          expect(@mail_ship_date.present?).to be(true)
          @mail_ship_date
        end

        def form_view
          @form_view = ShippingLabelPrintView.new(param) if @form_view.nil? || !@form_view.present?
          expect(@form_view.present?).to be(true)
          @form_view
        end
      end

      class PrintForm < Browser::StampsBrowserElement
      end
    end
  end
end
