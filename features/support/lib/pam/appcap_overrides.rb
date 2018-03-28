module Stamps
  module Pam

    class AppCapOverridesConfirmation < WebApps::Base
      def title
        StampsField.new driver.td(text: 'AppCap Overrides')
      end

      def ok_button
        StampsField.new driver.a(css: 'a[href*=Profile]')
      end

      def text
        StampsField.new(driver.td(css: "tbody:nth-child(1)>tr:nth-child(2)>td:nth-child(2)")).text
      end

      def present?
        title.present?
      end

      def ok
        ok_button.click
        ok_button.click_while_present
        text
      end
    end

    class AppCapCertifiedMail < WebApps::Base
      def always_on
        driver.radio(css: 'input[name=CertMail][value=On]').set
      end

      def always_off
        driver.radio(css: 'input[name=CertMail][value=off]').set
      end

      def no_override
        driver.radio(css: 'input[name=CertMail][value=None]').set
      end
    end

    class AppCapInternetPostagePrinting < WebApps::Base
      def always_on
        driver.radio(css: 'input[name=IBIP][value=On]').set
      end

      def always_off
        driver.radio(css: 'input[name=IBIP][value=off]').set
      end

      def no_override
        driver.radio(css: 'input[name=IBIP][value=None]').set
      end
    end

    class AppCapNetStampsPrinting < WebApps::Base
      def always_on
        driver.radio(css: 'input[name=NS][value=On]').set
      end

      def always_off
        driver.radio(css: 'input[name=NS][value=off]').set
      end

      def no_override
        driver.radio(css: 'input[name=NS][value=None]').set
      end
    end

    class AppCapShippingLabelPrinting < WebApps::Base
      def always_on
        driver.radio(css: 'input[name=SL][value=On]').set
      end

      def always_off
        driver.radio(css: 'input[name=SL][value=off]').set
      end

      def no_override
        driver.radio(css: 'input[name=SL][value=None]').set
      end
    end

    class AppCapInternationalShipping < WebApps::Base
      def always_on
        driver.radio(css: 'input[name=IntlShipping][value=On]').set
      end

      def always_off
        driver.radio(css: 'input[name=IntlShipping][value=off]').set
      end

      def no_override
        driver.radio(css: 'input[name=IntlShipping][value=None]').set
      end
    end

    class AppCapAllowHighRiskCountries < WebApps::Base
      def always_on
        driver.radio(css: 'input[name=AllowHighRiskCountries][value=On]').set
      end

      def always_off
        driver.radio(css: 'input[name=AllowHighRiskCountries][value=off]').set
      end

      def no_override
        driver.radio(css: 'input[name=AllowHighRiskCountries][value=None]').set
      end
    end

    class AppCapMailingLabelPrinting < WebApps::Base
      def always_on
        driver.radio(css: 'input[name=CreateMailingLabelIndicia][value=On]').set
      end

      def always_off
        driver.radio(css: 'input[name=CreateMailingLabelIndicia][value=off]').set
      end

      def no_override
        driver.radio(css: 'input[name=CreateMailingLabelIndicia][value=None]').set
      end
    end

    class AppCapOverridesPage < WebApps::Base
      def username
        StampsField.new(driver.a(css: "tbody>tr:nth-child(2)>td:nth-child(2)>a"))
      end

      def internet_postage_printing
        AppCapInternetPostagePrinting.new(param)
      end

      def netstamps_printing
        AppCapNetStampsPrinting.new(param)
      end

      def shipping_label_printing
        AppCapShippingLabelPrinting.new(param)
      end

      def international_shipping
        AppCapInternationalShipping.new(param)
      end

      def allow_high_risk_countries
        AppCapAllowHighRiskCountries.new(param)
      end

      def mailing_label_printing
        AppCapMailingLabelPrinting.new(param)
      end

      def certified_mail
        AppCapCertifiedMail.new(param)
      end

      def appcap_overrides
        AppCapOverridesConfirmation.new(param)
      end

      def submit_button
        StampsField.new driver.input(name: 'submit')
      end

      def present?
        submit_button.present?
      end

      def submit
        5.times do
          submit_button.click
          if appcap_overrides.present?
            log.info appcap_overrides.text
            log.info appcap_overrides.text
            log.info appcap_overrides.text
            log.info appcap_overrides.text
            log.info appcap_overrides.text
            return appcap_overrides
          end
        end
      end
    end
  end
end