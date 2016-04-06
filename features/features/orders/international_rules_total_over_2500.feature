Feature: Internal Transaction Number Required for total over $2500

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Details: Set Ounces to 5
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Open Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 3000, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Not required"
    Then Customs: Add Item 1, Description random, Qty 1, Price 2501, Lbs 1, Oz 1 Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # to be "Required"
    Then Customs: Set ITN# to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Close Customs Form
    Then Sign out
