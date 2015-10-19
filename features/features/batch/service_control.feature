
  Feature: Domestic USPS service used to fulfill an order.

  Background:
    Given I am signed in as a batch shipper

  @service_control @regression
  Scenario:  Inline Rates
    And I Add a new order
    Then Set single-order form Ship-From to default
    And Edit row 1 on the order grid

    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields

    Then Set single-order form Service to "Priority Mail Large/Thick Envelope"
    Then Expect Service to be Priority Mail Large/Thick Envelope

    Then Set single-order form Service to "Priority Mail Package"
    Then Expect Service to be Priority Mail Package

    Then Set single-order form Service to "Priority Mail Large Package"
    Then Expect Service to be Priority Mail Large Package

    Then Set single-order form Service to "Priority Mail Flat Rate Envelope"
    Then Expect Service to be Priority Mail Flat Rate Envelope

    Then Set single-order form Service to "Priority Mail Padded Flat Rate Envelope"
    Then Expect Service to be Priority Mail Padded Flat Rate Envelope

    Then Set single-order form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Expect Service to be Priority Mail Legal Flat Rate Envelope

    Then Set single-order form Service to "Priority Mail Regional Rate Box A"
    Then Expect Service to be Priority Mail Regional Rate Box A

    Then Set single-order form Service to "Priority Mail Regional Rate Box B"
    Then Expect Service to be Priority Mail Regional Rate Box B

    Then Set single-order form Service to "Priority Mail Regional Rate Box C"
    Then Expect Service to be Priority Mail Regional Rate Box C

    Then Set single-order form Service to "Priority Mail Express Package"
    Then Expect Service to be Priority Mail Express Package

    Then Set single-order form Service to "Priority Mail Express Flat Rate Envelope"
    Then Expect Service to be Priority Mail Express Flat Rate Envelope

    Then Set single-order form Service to Priority Mail Express Padded Flat Rate Envelope
    Then Expect Service to be Priority Mail Express Padded Flat Rate Envelope

    Then Set single-order form Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Expect Service to be Priority Mail Express Legal Flat Rate Envelope

    And Sign out
