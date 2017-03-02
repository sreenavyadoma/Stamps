Feature: Cuba Internal Transaction Number Required

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_cuba
  Scenario: Cuba Internal Transaction Number Required
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then set Order Details form Ounces to 5
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Not required
    Then set Customs form Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then add Customs form Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then Sign out
