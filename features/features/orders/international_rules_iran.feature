Feature: Iran Internal Transaction Number Required

  Background:
    Given I am signed in to Orders

  @rules_international
  Scenario: Iran Internal Transaction Number Required
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Iran    | random  | random  |
    Then Details: Set Ounces to 5
    Then Details: Select Service PM International Flat Rate Envelope

    Then Details: Edit Customs Form
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then Customs: Add Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs: Set ITN Number to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Sign out