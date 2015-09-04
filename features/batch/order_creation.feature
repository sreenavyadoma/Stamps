Feature: 10 orders

  Background:
    Given I am signed in as a batch shipper

  @orders_10
  Scenario:  Order Creation

    # First Class Mail
    Then Fail the test
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Package
    Then Set Insured Value to $15.00

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Package
    Then Set Insured Value to $45.00
    Then Set Tracking to USPS Tracking

    #Priority Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Large Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Legal Flat Rate Envelope
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Regional Rate Box A
    Then Set Insured Value to $105.00
    Then Set Tracking to Signature Required

    # Priority Mail Express

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Express Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 11
    Then Set Service to Priority Mail Express Padded Flat Rate Envelope
    Then Set Tracking to Signature Required

    # Media Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 3
    Then Set Service to Media Mail Package
    Then Set Insured Value to $56.00
    Then Set Tracking to Signature Required

    # Parcel Select

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 10
    Then Set Service to Parcel Select Large Package
    Then Set Insured Value to $235.00
    Then Set Tracking to USPS Tracking

  @orders_20
  Scenario:  Order Creation

    # First Class Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Package
    Then Set Insured Value to $15.00

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Package
    Then Set Insured Value to $45.00
    Then Set Tracking to USPS Tracking

    #Priority Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Large Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Legal Flat Rate Envelope
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Regional Rate Box A
    Then Set Insured Value to $105.00
    Then Set Tracking to Signature Required

    # Priority Mail Express

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Express Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 11
    Then Set Service to Priority Mail Express Padded Flat Rate Envelope
    Then Set Tracking to Signature Required

    # Media Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 3
    Then Set Service to Media Mail Package
    Then Set Insured Value to $56.00
    Then Set Tracking to Signature Required

    # Parcel Select

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 10
    Then Set Service to Parcel Select Large Package
    Then Set Insured Value to $235.00
    Then Set Tracking to USPS Tracking


    # First Class Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Package
    Then Set Insured Value to $15.00

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Package
    Then Set Insured Value to $45.00
    Then Set Tracking to USPS Tracking

    #Priority Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Large Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 1
    Then Set Service to Priority Mail Legal Flat Rate Envelope
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Regional Rate Box A
    Then Set Insured Value to $105.00
    Then Set Tracking to Signature Required

    # Priority Mail Express

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 1
    Then Set Service to Priority Mail Express Package
    Then Set Tracking to Signature Required

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 11
    Then Set Service to Priority Mail Express Padded Flat Rate Envelope
    Then Set Tracking to Signature Required

    # Media Mail

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Ounces to 3
    Then Set Service to Media Mail Package
    Then Set Insured Value to $56.00
    Then Set Tracking to Signature Required

    # Parcel Select

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Pounds to 10
    Then Set Service to Parcel Select Large Package
    Then Set Insured Value to $235.00
    Then Set Tracking to USPS Tracking


