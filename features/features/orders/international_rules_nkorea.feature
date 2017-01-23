Feature: North Korea Internal Transaction Number Required

  Background:
    Given I am signed in to Orders

  @rules_international
  Scenario: North Korea Internal Transaction Number Required
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Democratic People's Republic of (North) Korea| random  | random  |
    Then Order Details: Set Ounces to 5
    Then Order Details: Select Service PMI Flat Rate Envelope
    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Set Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Set Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Set Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Not required
    Then Customs Form: Set Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Not required
    Then Customs Form: Set Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Set Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then Customs Form: Set ITN Number to "random"
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Sign out
