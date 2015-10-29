Feature: 25 orders

  Background:
    Given I am signed in as a batch shipper

  @orders_25 @jenkins_orders
  Scenario:  25 orders

    # International
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Add single-order form Item - Quantity 1, ID random, Description random
    Then Set single-order form Ounces to 2
    And Set single-order form Pounds to 2
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 100
    Then Set customs form I agree to true
    Then Close customs form
    Then Set single-order form Service to "First-Class Mail International Large Envelope/Flat"

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1    | street_address_2 | city   | province | postal_code  | country   | phone   |  email  |
      | random | random  | 123 Kangaroo Court  | random           | Perth  | Wallaby  | DEF 0C4      | Australia | 9876543210  | junk@stamps.com  |
    Then Add single-order form Item - Quantity 1, ID random, Description random
    And Open customs form
    And Set single-order form Ounces to 2
    And Set single-order form Pounds to 2
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 100
    Then Set customs form I agree to true
    Then Close customs form
    Then Set single-order form Service to "Priority Mail International Flat Rate Envelope"

    # First Class Mail
    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 1
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "First-Class Mail Large Envelope/Flat"
    And Set single-order form Insured Value to $15.00
    And Set single-order form Tracking to "None"
    Then Uncheck row 1 on the order grid

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 2
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "First-Class Mail Package/Thick Envelope"
    And Set single-order form Insured Value to $45.00
    And Set single-order form Tracking to "USPS Tracking"
    Then Uncheck row 1 on the order grid

    #Priority Mail
    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    Then Uncheck row 1 on the order grid
    And Set single-order form Ounces to 3
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Large/Thick Envelope"
    And Set single-order form Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 4
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Package"
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 5
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Large Package"
    And Set single-order form Insured Value to $145.00
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 6
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Flat Rate Envelope"
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 7
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Padded Flat Rate Envelope"
    And Set single-order form Insured Value to $98.00
    And Set single-order form Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 8
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Legal Flat Rate Envelope"
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 9
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Small Flat Rate Box"
    And Set single-order form Insured Value to $30.00
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 10
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Medium Flat Rate Box"
    And Set single-order form Insured Value to $45.00
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 11
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Large Flat Rate Box"
    And Set single-order form Insured Value to $239.00
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 12
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Regional Rate Box A"
    And Set single-order form Insured Value to $105.00
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 13
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Regional Rate Box B"
    And Set single-order form Insured Value to $205.00
    And Set single-order form Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 14
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Regional Rate Box C"
    And Set single-order form Insured Value to $305.00
    And Set single-order form Tracking to "Signature Required"

    # Priority Mail Express
    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Ounces to 15
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Express Package"
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 16
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Express Flat Rate Envelope"
    And Set single-order form Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 17
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Express Padded Flat Rate Envelope"
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 18
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Express Legal Flat Rate Envelope"
    And Set single-order form Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 19
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Priority Mail Express Medium Flat Rate Box"
    And Set single-order form Tracking to "Signature Required"

    # Media Mail
    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 20
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Media Mail Package"
    And Set single-order form Insured Value to $56.00
    And Set single-order form Tracking to "Signature Required"

    # Parcel Select
    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 21
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Parcel Select Package"
    And Set single-order form Insured Value to $345.00
    And Set single-order form Tracking to "USPS Tracking"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 22
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Parcel Select Large Package"
    And Set single-order form Insured Value to $456.00
    And Set single-order form Tracking to "Signature Required"

    Then I Add a new order
    And Expect new Order ID created
    And Set single-order form Ship-From to default
    And Set single-order form Ship-To address to random
    And Set single-order form Pounds to 23
    And Set single-order form Length to 1
    And Set single-order form Width to 1
    And Set single-order form Height to 1
    And Set single-order form Service to "Parcel Select Oversized Package"
    And Set single-order form Insured Value to $567.00
    And Set single-order form Tracking to "Signature Required"
    And Sign out
