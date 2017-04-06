module Stamps
  module Pam

    class AppCapOverridesConfirmation < Browser::StampsModal
      attr_reader :title, :ok_button

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.td(text: 'AppCap Overrides')
        @ok_button = StampsElement.new browser.a(css: 'a[href*=Profile]')
      end

      def text
        title.text
      end

      def present?
        title.present?
      end

      def ok
        ok_button.send_keys(:enter)
        ok_button.click_while_present
      end
    end

    class InternetPostagePrinting < Browser::StampsModal
      def always_on
        browser.radio(css: 'input[name=IBIP][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=IBIP][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=IBIP][value=None]').set
      end
    end

    class NetStampsPrinting < Browser::StampsModal
      def always_on
        browser.radio(css: 'input[name=NS][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=NS][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=NS][value=None]').set
      end
    end

    class ShippingLabelPrinting < Browser::StampsModal
      def always_on
        browser.radio(css: 'input[name=SL][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=SL][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=SL][value=None]').set
      end
    end

    class InternationalShipping < Browser::StampsModal
      def always_on
        browser.radio(css: 'input[name=IntlShipping][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=IntlShipping][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=IntlShipping][value=None]').set
      end
    end

    class AllowHighRiskCountries < Browser::StampsModal
      def always_on
        browser.radio(css: 'input[name=AllowHighRiskCountries][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=AllowHighRiskCountries][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=AllowHighRiskCountries][value=None]').set
      end
    end

    class MailingLabelPrinting < Browser::StampsModal
      def always_on
        browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=On]').set
      end

      def always_off
        browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=off]').set
      end

      def no_override
        browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=None]').set
      end
    end

    class AppCapOverrides < Browser::StampsModal
      attr_reader :internet_postage_printing, :netstamps_printing, :shipping_label_printing, :international_shipping, :allow_high_risk_countries,
                  :mailing_label_printing, :submit_button, :appcap_overrides

      def initialize(param)
        super(param)
        @internet_postage_printing = InternetPostagePrinting.new(param)
        @netstamps_printing = NetStampsPrinting.new(param)
        @shipping_label_printing = ShippingLabelPrinting.new(param)
        @international_shipping = InternationalShipping.new(param)
        @allow_high_risk_countries = AllowHighRiskCountries.new(param)
        @mailing_label_printing = MailingLabelPrinting.new(param)
        @submit_button = StampsElement.new browser.input(name: 'submit')
        @appcap_overrides = AppCapOverridesConfirmation.new(param)
      end

      def present?
        submit_button.present?
      end

      def submit
        5.times do
          submit_button.click
          if appcap_overrides.present?
            logger.message appcap_overrides.text
            logger.message appcap_overrides.text
            logger.message appcap_overrides.text
            logger.message appcap_overrides.text
            logger.message appcap_overrides.text
            return appcap_overrides
          end
        end
      end
    end
  end
end