Feature: Internal Transaction Number Required for total over $2500

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_over_2500
  Scenario: Customs Form Internal Transaction Number Required for total over $2500
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PMI Flat Rate Envelope
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random
    Then set Order Details form service to FCMI Large Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Not required
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 2501, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then Sign out
