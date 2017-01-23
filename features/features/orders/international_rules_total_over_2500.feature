Feature: Internal Transaction Number Required for total over $2500

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then Order Details: Set Ounces to 5
    Then Order Details: Select Service PMI Flat Rate Envelope
    Then Order Details: Add Item 1, Qty 1, ID random, Description random
    Then Order Details: Select Service FCMI Large Envelope
    Then Order Details: Edit Customs Form
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Not required
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 2501, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Set ITN Number to "random"
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Sign out
