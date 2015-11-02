Feature: Test Development

  Background:
    Given I am signed in as a batch shipper

  @_dev_rob
  Scenario: Domestic FPO Address
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set single-order form Ounces to 5
    Then Set single-order form Length to 1
    Then Set single-order form Height to 1
    Then Set single-order form Width to 1
    Then Set single-order form Service to "Priority Mail Package"
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Print

  @rob_dev_int
  Scenario:
    # International
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | 0123456789  | junk@stamps.com  |
    Then Add single-order form Item - Quantity 1, ID random, Description random
    Then Set single-order form Ounces to 2
    And Set single-order form Pounds to 2
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
    And Set single-order form Ounces to 2
    And Set single-order form Pounds to 2
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 100.50, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 100
    Then Set customs form I agree to true
    Then Close customs form
    Then Set single-order form Service to "Priority Mail International Flat Rate Envelope"
