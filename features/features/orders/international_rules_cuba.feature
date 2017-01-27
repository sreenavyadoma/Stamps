Feature: Cuba Internal Transaction Number Required

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_cuba
  Scenario: Cuba Internal Transaction Number Required
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Cuba    | random  | random  |

    Then On Order Details form, set Ounces to 5
    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then On Customs form, set Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then On Customs form, set Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then On Customs form, set Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then On Customs form, set Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 3000, Origin United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then On Customs form, set ITN Number to "random"
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then Sign out
