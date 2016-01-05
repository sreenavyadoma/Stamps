Feature: Internal Transaction Number Required for total over $2500

  Background:
    Given I am signed in to Orders

  @international_rules_engine
  Scenario: Customs Form - Internal Transaction Number Required for total over $2500
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Package"
    Then Set Order Details Item - Quantity 1, ID random, Description random
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    And Open customs form
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 3000, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 1, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Not required"
    And Add Customs Form Item 1; Description=random, Qty 1, Unit Price 2501, Weight(lbs) 1, Weight(oz) 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Set customs form ITN# to "random"
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    And Sign out
