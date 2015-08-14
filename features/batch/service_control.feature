  @regression
  Feature: B-01588 Domestic USPS service used to fulfill an order.

  Background:
    Given I am signed in as a batch shipper

  @service_control
  Scenario:  Inline Rates
    * Add new order
    * Set Ship From to default
    * Edit row 1 on the order grid

    * Set Ship-To address to random
    * Collapse Ship-To Address

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
