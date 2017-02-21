module Stamps
  module Mail
    module PrintFormPanel

      module PrintFormMailFrom
        def mail_from
          @mail_from = MailFrom.new(param) if @mail_from.nil? || !@mail_from.present?
          expect(@mail_from.present?).to be true
          @mail_from
        end
      end

      module PrintFormMailTo
        def mail_to
          @mail_to = MailTo.new(param) if @mail_to.nil? || !@mail_to.present?
          expect(@mail_to.present?).to be true
          @mail_to
        end
      end

      module PrintFormMailWeight
        def mail_weight
          @mail_weight = MailWeight.new(param) if @mail_weight.nil? || !@mail_weight.present?
          expect(@mail_weight.present?).to be true
          @mail_weight
        end
      end

      module PrintFormMailService
        def mail_service
          @mail_service = MailService.new(param) if @mail_service.nil? || !@mail_service.present?
          expect(@mail_service.present?).to be true
          @mail_service
        end
      end

      module Stamps
        include PrintFormMailTo
        include PrintFormMailWeight
        include PrintFormMailService
      end

      module CertifiedMail
        include PrintFormMailFrom
        include PrintFormMailTo
        include PrintFormMailWeight
        include PrintFormMailService
      end

      module Rolls
        include PrintFormMailFrom
        include PrintFormMailTo
        include PrintFormMailWeight
        include PrintFormMailService
      end

      module Envelopes
        include PrintFormMailFrom
        include PrintFormMailTo
        include PrintFormMailWeight
        include PrintFormMailService

        def insure_for
          DetailsInsureFor.new(param)
        end

        def ship_date
          ShipDate.new(param)
        end

        def form_view
          EnvelopeFormView.new(param)
        end
      end

      module ShippingLabels
        include PrintFormMailFrom
        include PrintFormMailTo
        include PrintFormMailWeight
        include PrintFormMailService

        def mail_insure_for
          @mail_insure_for = DetailsInsureFor.new(param) if @mail_insure_for.nil? || !@mail_insure_for.present?
          expect(@mail_insure_for.present?).to be true
          @mail_insure_for
        end

        def mail_tracking
          @mail_tracking = MailTracking.new(param) if @mail_insure_for.nil? || !@mail_insure_for.present?
          expect(@mail_insure_for.present?).to be true
          @mail_insure_for
        end

        def mail_ship_date
          @mail_ship_date = ShipDate.new(param) if @mail_ship_date.nil? || !@mail_ship_date.present?
          expect(@mail_ship_date.present?).to be true
          @mail_ship_date
        end

        def form_view
          @form_view = ShippingLabelPrintView.new(param) if @form_view.nil? || !@form_view.present?
          expect(@form_view.present?).to be true
          @form_view
        end
      end

      class PrintForm < Browser::StampsHtmlField
        def open_extra_services
          10.times do
            extra_services.safe_click
            extra_services.wait_until_present(2)
            return service_modal if service_modal.present?
          end
          expect(service_modal.present?).to be true
        end
      end
    end

  end
end

=begin

          @email_tracking = Email.new(param)
          @tracking = Tracking.new(param)
          @customs = PrintPostageCustoms.new(param)
          @extra_services = StampsElement.new(browser.span(id: "sdc-mainpanel-extraservicesbtn-btnIconEl"))
          @service_modal = ExtraServices.new(param)
=end