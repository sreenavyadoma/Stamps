Feature: Sudan Internal Transaction Number Required

  Background:
    Given a valid user is signed in to Web Apps

      # Sudan Internal Transaction Number Required
  @international_rogue_countries @rules_international
  Scenario: Sudan Internal Transaction Number Required
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Sudan    | random  | random  |

    Then on Order Details form, set Ounces to 5
    Then on Order Details form, select service PMI Flat Rate Envelope

    #Then on Order Details form, select service FCMI Large Envelope
    Then on Order Details form, click Edit Form button
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set Package Contents to Commercial Sample
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set Package Contents to Document
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set Package Contents to Merchandise
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set Package Contents to Gift
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set Package Contents to Humanitarian Donation
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set Package Contents to Returned Goods
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set Package Contents to Other
    Then Expect Customs Form Internal Transaction Number is Required

    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 3000, Made In United States, Tariff 10
    Then Expect Customs Form Internal Transaction Number is Required
    Then on Customs form, set ITN Number to "random"
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then Sign out
