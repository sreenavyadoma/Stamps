# encoding: utf-8
Feature: 25 orders

  Background:
    Given I am signed in to Orders

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Set Order Details Item - Quantity 1, ID random, Description random
    Then Set Order Details Ounces to 2
    And Set Order Details Pounds to 2
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 100
    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Set Order Details Item - Quantity 1, ID random, Description random
    And Set Order Details Ounces to 2
    And Set Order Details Pounds to 2
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 100
    Then Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions
    Then Close customs form
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail
    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 1
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    And Set Order Details Insured Value to $15.00
    And Set Order Details Tracking to "None"
    Then Uncheck row 1 on the order grid

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 2
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "First-Class Mail Package/Thick Envelope"
    And Set Order Details Insured Value to $45.00
    And Set Order Details Tracking to "USPS Tracking"
    Then Uncheck row 1 on the order grid

    #Priority Mail
    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Uncheck row 1 on the order grid
    And Set Order Details Ounces to 3
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Large/Thick Envelope"
    And Set Order Details Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 4
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Package"
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 5
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Large Package"
    And Set Order Details Insured Value to $145.00
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 6
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Flat Rate Envelope"
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 7
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    And Set Order Details Insured Value to $98.00
    And Set Order Details Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 8
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 9
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Small Flat Rate Box"
    And Set Order Details Insured Value to $30.00
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 10
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    And Set Order Details Insured Value to $45.00
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 11
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Large Flat Rate Box"
    And Set Order Details Insured Value to $239.00
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 12
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Regional Rate Box A"
    And Set Order Details Insured Value to $105.00
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 13
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Regional Rate Box B"
    And Set Order Details Insured Value to $205.00
    And Set Order Details Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 14
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Insured Value to $305.00
    And Set Order Details Tracking to "Signature Required"

    # Priority Mail Express
    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Ounces to 15
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Express Package"
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 16
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    And Set Order Details Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 17
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 18
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    And Set Order Details Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 19
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    And Set Order Details Tracking to "Signature Required"

    # Media Mail
    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 20
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Media Mail Package"
    And Set Order Details Insured Value to $56.00
    And Set Order Details Tracking to "Signature Required"

    # Parcel Select
    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 21
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Parcel Select Ground Package"
    And Set Order Details Insured Value to $345.00
    And Set Order Details Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 22
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Parcel Select Ground Large Package"
    And Set Order Details Insured Value to $456.00
    And Set Order Details Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set Order Details Ship-From to default
    And Set Order Details Ship-To address to random ship to zone 1 through 4
    And Set Order Details Pounds to 23
    And Set Order Details Length to 1
    And Set Order Details Width to 1
    And Set Order Details Height to 1
    And Set Order Details Service to "Parcel Select Ground Oversized Package"
    And Set Order Details Insured Value to $567.00
    And Set Order Details Tracking to "Signature Required"
    And Sign out
