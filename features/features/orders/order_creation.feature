Feature: 10 orders

  Background:
    Given I am signed in to Orders

  @orders_10 @order_creation
  Scenario:  Order Creation

    # First Class Mail
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $15.00

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $45.00
    Then Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Large Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Set Order Details Insured Value to $105.00
    Then Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Express Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 11
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Tracking to "Signature Required"

    # Media Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 3
    Then Set Order Details Service to "Media Mail Package"
    Then Set Order Details Insured Value to $56.00
    Then Set Order Details Tracking to "Signature Required"

    # Parcel Select

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 10
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Set Order Details Insured Value to $235.00
    Then Set Order Details Tracking to "USPS Tracking"

    And Sign out

  @orders_20 @order_creation
  Scenario:  Order Creation

    # First Class Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $15.00

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $45.00
    Then Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Large Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Set Order Details Insured Value to $105.00
    Then Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Express Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 11
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Tracking to "Signature Required"

    # Media Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 3
    Then Set Order Details Service to "Media Mail Package"
    Then Set Order Details Insured Value to $56.00
    Then Set Order Details Tracking to "Signature Required"

    # Parcel Select

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 10
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Set Order Details Insured Value to $235.00
    Then Set Order Details Tracking to "USPS Tracking"


    # First Class Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $15.00

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insured Value to $45.00
    Then Set Order Details Tracking to "USPS Tracking"

    #Priority Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Large Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Set Order Details Insured Value to $105.00
    Then Set Order Details Tracking to "Signature Required"

    # Priority Mail Express

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Service to "Priority Mail Express Package"
    Then Set Order Details Tracking to "Signature Required"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 11
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Tracking to "Signature Required"

    # Media Mail

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Ounces to 3
    Then Set Order Details Service to "Media Mail Package"
    Then Set Order Details Insured Value to $56.00
    Then Set Order Details Tracking to "Signature Required"

    # Parcel Select

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 10
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Set Order Details Insured Value to $235.00
    Then Set Order Details Tracking to "USPS Tracking"


