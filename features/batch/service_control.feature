  @regression
  Feature: B-01588 Domestic USPS service used to fulfill an order.
  Background:
    Given I am signed in as a batch shipper

  @service_control
  Scenario:  Inline Rates
    * Add new order
    * Edit row 1 in the order grid

    * Set Recipient Address to B-01588, Inline Rates, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button

    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Service to be First-Class Mail Large Envelope/Flat

    * Set Service to First-Class Mail Package/Thick Envelope
    * Expect Service to be First-Class Mail Package/Thick Envelope

    * Set Service to Priority Mail Large/Thick Envelope
    * Expect Service to be Priority Mail Large/Thick Envelope

    * Set Service to Priority Mail Package
    * Expect Service to be Priority Mail Package

    * Set Service to Priority Mail Large Package
    * Expect Service to be Priority Mail Large Package

    * Set Service to Priority Mail Flat Rate Envelope
    * Expect Service to be Priority Mail Flat Rate Envelope

    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Expect Service to be Priority Mail Padded Flat Rate Envelope

    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Expect Service to be Priority Mail Legal Flat Rate Envelope

    * Set Service to Priority Mail Regional Rate Box A
    * Expect Service to be Priority Mail Regional Rate Box A

    * Set Service to Priority Mail Regional Rate Box B
    * Expect Service to be Priority Mail Regional Rate Box B

    * Set Service to Priority Mail Regional Rate Box C
    * Expect Service to be Priority Mail Regional Rate Box C

    * Set Service to Priority Mail Express Package
    * Expect Service to be Priority Mail Express Package

    * Set Service to Priority Mail Express Flat Rate Envelope
    * Expect Service to be Priority Mail Express Flat Rate Envelope

    * Set Service to Priority Mail Express Padded Flat Rate Envelope
    * Expect Service to be Priority Mail Express Padded Flat Rate Envelope

    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Expect Service to be Priority Mail Express Legal Flat Rate Envelope

    * Sign out
