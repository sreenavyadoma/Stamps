Feature: Test Development
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
