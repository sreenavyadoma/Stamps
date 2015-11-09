Feature: 10 orders

  Background:
    Given I am signed in as a batch shipper

  @orders_10
  Scenario:  Order Creation

    # First Class Mail
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $15.00

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $45.00
    Then Set Order Form Tracking to "USPS Tracking"

    #Priority Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Large Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Regional Rate Box A"
    Then Set Order Form Insured Value to $105.00
    Then Set Order Form Tracking to "Signature Required"

    # Priority Mail Express

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Express Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 11
    Then Set Order Form Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Form Tracking to "Signature Required"

    # Media Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 3
    Then Set Order Form Service to "Media Mail Package"
    Then Set Order Form Insured Value to $56.00
    Then Set Order Form Tracking to "Signature Required"

    # Parcel Select

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 10
    Then Set Order Form Service to "Parcel Select Large Package"
    Then Set Order Form Insured Value to $235.00
    Then Set Order Form Tracking to "USPS Tracking"

    And Sign out

  @orders_20
  Scenario:  Order Creation

    # First Class Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $15.00

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $45.00
    Then Set Order Form Tracking to "USPS Tracking"

    #Priority Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Large Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Regional Rate Box A"
    Then Set Order Form Insured Value to $105.00
    Then Set Order Form Tracking to "Signature Required"

    # Priority Mail Express

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Express Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 11
    Then Set Order Form Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Form Tracking to "Signature Required"

    # Media Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 3
    Then Set Order Form Service to "Media Mail Package"
    Then Set Order Form Insured Value to $56.00
    Then Set Order Form Tracking to "Signature Required"

    # Parcel Select

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 10
    Then Set Order Form Service to "Parcel Select Large Package"
    Then Set Order Form Insured Value to $235.00
    Then Set Order Form Tracking to "USPS Tracking"


    # First Class Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $15.00

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $45.00
    Then Set Order Form Tracking to "USPS Tracking"

    #Priority Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Large Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Regional Rate Box A"
    Then Set Order Form Insured Value to $105.00
    Then Set Order Form Tracking to "Signature Required"

    # Priority Mail Express

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 1
    Then Set Order Form Service to "Priority Mail Express Package"
    Then Set Order Form Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 11
    Then Set Order Form Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Form Tracking to "Signature Required"

    # Media Mail

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 3
    Then Set Order Form Service to "Media Mail Package"
    Then Set Order Form Insured Value to $56.00
    Then Set Order Form Tracking to "Signature Required"

    # Parcel Select

    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Pounds to 10
    Then Set Order Form Service to "Parcel Select Large Package"
    Then Set Order Form Insured Value to $235.00
    Then Set Order Form Tracking to "USPS Tracking"


