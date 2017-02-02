Feature: Internal Transaction Number Required for total over $2500

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then on Order Details form, set Ounces to 5
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then on Order Details form, select service FCMI Large Envelope
    Then on Order Details form, click Edit Form button
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Not required
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 2501, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set ITN Number to "random"
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then Sign out
