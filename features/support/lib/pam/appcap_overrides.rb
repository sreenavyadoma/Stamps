module Pam
  class AppCapOverrides < Stamps::Browser::BrowserObject

    class AppCapOverridesConfirmation < Stamps::Browser::BrowserObject
      def present?
        browser_helper.present? @browser.td(text: 'AppCap Overrides')
      end

      def ok
        button = StampsButton.new @browser.a(text: ' OK ')
        button.click_while_present
        Pam::CustomerProfile.new @browser
      end
    end

    class InternetPostagePrinting < Stamps::Browser::BrowserObject
      def always_on
        @browser.radio(css: 'input[name=IBIP][value=On]').set
      end

      def always_off
        @browser.radio(css: 'input[name=IBIP][value=off]').set
      end

      def no_override
        @browser.radio(css: 'input[name=IBIP][value=None]').set
      end
    end

    class NetStampsPrinting < Stamps::Browser::BrowserObject
      def always_on
        @browser.radio(css: 'input[name=NS][value=On]').set
      end

      def always_off
        @browser.radio(css: 'input[name=NS][value=off]').set
      end

      def no_override
        @browser.radio(css: 'input[name=NS][value=None]').set
      end
    end

    class ShippingLabelPrinting < Stamps::Browser::BrowserObject
      def always_on
        @browser.radio(css: 'input[name=SL][value=On]').set
      end

      def always_off
        @browser.radio(css: 'input[name=SL][value=off]').set
      end

      def no_override
        @browser.radio(css: 'input[name=SL][value=None]').set
      end
    end

    class InternationalShipping < Stamps::Browser::BrowserObject
      def always_on
        @browser.radio(css: 'input[name=IntlShipping][value=On]').set
      end

      def always_off
        @browser.radio(css: 'input[name=IntlShipping][value=off]').set
      end

      def no_override
        @browser.radio(css: 'input[name=IntlShipping][value=None]').set
      end
    end

    class AllowHighRiskCountries < Stamps::Browser::BrowserObject
      def always_on
        @browser.radio(css: 'input[name=AllowHighRiskCountries][value=On]').set
      end

      def always_off
        @browser.radio(css: 'input[name=AllowHighRiskCountries][value=off]').set
      end

      def no_override
        @browser.radio(css: 'input[name=AllowHighRiskCountries][value=None]').set
      end
    end

    class MailingLabelPrinting < Stamps::Browser::BrowserObject
      def always_on
        @browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=On]').set
      end

      def always_off
        @browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=off]').set
      end

      def no_override
        @browser.radio(css: 'input[name=CreateMailingLabelIndicia][value=None]').set
      end
    end

    def present?
      browser_helper.present? @browser.input(css: 'input[name=IBIP][value=On]')
    end

    def internet_postage_printing
      InternetPostagePrinting.new @browser
    end

    def netstamps_printing
      NetStampsPrinting.new @browser
    end

    def shipping_label_printing
      ShippingLabelPrinting.new @browser
    end

    def international_shipping
      InternationalShipping.new @browser
    end

    def allow_high_risk_countries
      AllowHighRiskCountries.new @browser
    end

    def mailing_label_printing
      MailingLabelPrinting.new @browser
    end

    def submit
      button = StampsButton.new @browser.input(name: 'submit')
      appcap_overrides = AppCapOverridesConfirmation.new @browser
      5.times do
        button.safe_click
        return appcap_overrides if appcap_overrides.present?
      end
    end
  end
end