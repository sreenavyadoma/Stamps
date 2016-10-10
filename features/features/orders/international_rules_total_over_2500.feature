Feature: Internal Transaction Number Required for total over $2500

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Details: Set Ounces to 5
    Then Details: Select Service Priority Mail International Flat Rate Envelope
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Select Service First-Class Mail International Large Envelope/Flat
    Then Details: Edit Customs Form
    Then Customs: Add Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # is "Required"
    Then Customs: Add Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # is "Not required"
    Then Customs: Add Item 1, Description random, Qty 1, Price 2501, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction # is "Required"
    Then Customs: Set ITN Number to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Sign out
