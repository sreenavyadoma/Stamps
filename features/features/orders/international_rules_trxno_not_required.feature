Feature: Internal Transaction # Not Required

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international
  Scenario: Internal Transaction # Not Required
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Philippines    | random  | random  |
    Then On Order Details form, set Ounces to 5
    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, set Ounces to 5
    Then On Order Details form, click Edit Form button
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Not required
    Then Expect Customs Form Internal Transaction Number is Not required
    Then On Customs form, set ITN Number to "random"
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then Sign out
