Feature: Test Development

  Background:
    Given I am signed in as a batch shipper

  @canadian_address_rob
  Scenario: Customs Form - Internal Transaction # Required for total over $2500
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set single-order form Ounces to 1
    Then Set single-order form Pounds to 1
    Then Add single-order form Item - Quantity 1, ID random, Description random
    Then Set single-order form Service to "First-Class Mail International Large Envelope"
    And Open customs form
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 1, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Not required
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 2501, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be Required
    Then Set customs form ITN# to "random"
    Then Set customs form I agree to true
    Then Close customs form

  @canadian_address_rob
  Scenario: Domestic FPO Address
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To country to United States
    Then Set single-order form Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | Uss Mason DDG 87  | FPO  | AE    | 09578  | United States | random | random |
    Then Set single-order form Service to "Priority Mail Package"
    And Open customs form
    Then Set customs form Package Contents to "Merchandise"
    And Add or Edit Customs Form Item 1; Description=random, Qty 1, Unit Price 30, Weight(lbs) 0, Weight(oz) 1 Origin United States, Tariff 10
    Then Close customs form
    Then Print
