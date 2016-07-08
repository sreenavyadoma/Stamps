module Pam
  class AppCapOverrides < Browser::Modal

    class AppCapOverridesConfirmation < Browser::Modal
      def present?
        browser.td(text: 'AppCap Overrides').present?
      end

      def ok
        button = BrowserElement.new browser.a(text: ' OK ')
        button.click_while_present
        Pam::CustomerProfile.new param
      end
    end

    class InternetPostagePrinting < Browser::Modal
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

    class NetStampsPrinting < Browser::Modal
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

    class ShippingLabelPrinting < Browser::Modal
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

    class InternationalShipping < Browser::Modal
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

    class AllowHighRiskCountries < Browser::Modal
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

    class MailingLabelPrinting < Browser::Modal
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

    def present?
      browser.text_box(css: 'input[name=IBIP][value=On]').present?
    end

    def internet_postage_printing
      InternetPostagePrinting.new param
    end

    def netstamps_printing
      NetStampsPrinting.new param
    end

    def shipping_label_printing
      ShippingLabelPrinting.new param
    end

    def international_shipping
      InternationalShipping.new param
    end

    def allow_high_risk_countries
      AllowHighRiskCountries.new param
    end

    def mailing_label_printing
      MailingLabelPrinting.new param
    end

    def submit
      button = BrowserElement.new browser.text_box(name: 'submit')
      appcap_overrides = AppCapOverridesConfirmation.new param
      5.times do
        button.safe_click
        return appcap_overrides if appcap_overrides.present?
      end
    end
  end
end