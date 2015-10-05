Feature: 10 orders

  Background:
    Given I am signed in as a batch shipper

  @orders_10
  Scenario:  Order Creation

    # First Class Mail
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Insured Value to $15.00

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Insured Value to $45.00
    Then Set single-order form Tracking to USPS Tracking

    #Priority Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Large Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Regional Rate Box A"
    Then Set single-order form Insured Value to $105.00
    Then Set single-order form Tracking to Signature Required

    # Priority Mail Express

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Express Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 11
    Then Set single-order form Service to Priority Mail Express Padded Flat Rate Envelope
    Then Set single-order form Tracking to Signature Required

    # Media Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 3
    Then Set single-order form Service to "Media Mail Package"
    Then Set single-order form Insured Value to $56.00
    Then Set single-order form Tracking to Signature Required

    # Parcel Select

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 10
    Then Set single-order form Service to "Parcel Select Large Package"
    Then Set single-order form Insured Value to $235.00
    Then Set single-order form Tracking to USPS Tracking

  @orders_20
  Scenario:  Order Creation

    # First Class Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Insured Value to $15.00

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Insured Value to $45.00
    Then Set single-order form Tracking to USPS Tracking

    #Priority Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Large Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Regional Rate Box A"
    Then Set single-order form Insured Value to $105.00
    Then Set single-order form Tracking to Signature Required

    # Priority Mail Express

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Express Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 11
    Then Set single-order form Service to Priority Mail Express Padded Flat Rate Envelope
    Then Set single-order form Tracking to Signature Required

    # Media Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 3
    Then Set single-order form Service to "Media Mail Package"
    Then Set single-order form Insured Value to $56.00
    Then Set single-order form Tracking to Signature Required

    # Parcel Select

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 10
    Then Set single-order form Service to "Parcel Select Large Package"
    Then Set single-order form Insured Value to $235.00
    Then Set single-order form Tracking to USPS Tracking


    # First Class Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Insured Value to $15.00

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Insured Value to $45.00
    Then Set single-order form Tracking to USPS Tracking

    #Priority Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Large Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Regional Rate Box A"
    Then Set single-order form Insured Value to $105.00
    Then Set single-order form Tracking to Signature Required

    # Priority Mail Express

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Service to "Priority Mail Express Package"
    Then Set single-order form Tracking to Signature Required

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 11
    Then Set single-order form Service to Priority Mail Express Padded Flat Rate Envelope
    Then Set single-order form Tracking to Signature Required

    # Media Mail

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 3
    Then Set single-order form Service to "Media Mail Package"
    Then Set single-order form Insured Value to $56.00
    Then Set single-order form Tracking to Signature Required

    # Parcel Select

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 10
    Then Set single-order form Service to "Parcel Select Large Package"
    Then Set single-order form Insured Value to $235.00
    Then Set single-order form Tracking to USPS Tracking


