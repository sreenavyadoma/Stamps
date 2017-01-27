Feature: International Shipping fields and Customs Information fields validation

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to Japan

    Then on Order Details form, expect International Address fields are visible
    Then on Order Details form, expect Domestic Ship-To fields are hidden
    Then on Order Details form, expect Customs Restrictions button is visible
    Then on Order Details form, expect Customs Edit Form button is visible

    Then on Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then on Order Details form, set Ounces to 5
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then on Order Details form, click Edit Form button

    Then on Customs form, set Package Contents to Commercial Sample
    Then on Customs form, expect More Info is hidden
    Then on Customs form, expect License Number is visible
    Then on Customs form, expect Certificate Number is visible
    Then on Customs form, expect Invoice Number is visible

    Then on Customs form, set Package Contents to Document
    Then on Customs form, expect More Info is visible
    Then on Customs form, expect License Number is hidden
    Then on Customs form, expect Certificate Number is hidden
    Then on Customs form, expect Invoice Number is hidden

    Then on Customs form, set Package Contents to Gift
    Then on Customs form, expect More Info is visible
    Then on Customs form, expect License Number is hidden
    Then on Customs form, expect Certificate Number is hidden
    Then on Customs form, expect Invoice Number is hidden

    Then on Customs form, set Package Contents to Humanitarian Donation
    Then on Customs form, expect More Info is visible
    Then on Customs form, expect License Number is hidden
    Then on Customs form, expect Certificate Number is hidden
    Then on Customs form, expect Invoice Number is hidden

    Then on Customs form, set Package Contents to Merchandise
    Then on Customs form, expect More Info is visible
    Then on Customs form, expect License Number is hidden
    Then on Customs form, expect Certificate Number is hidden
    Then on Customs form, expect Invoice Number is hidden

    Then on Customs form, set Package Contents to Returned Goods
    Then on Customs form, expect More Info is visible
    Then on Customs form, expect License Number is hidden
    Then on Customs form, expect Certificate Number is hidden
    Then on Customs form, expect Invoice Number is hidden

    Then on Customs form, set Package Contents to Commercial Sample
    Then on Customs form, expect More Info is hidden
    Then on Customs form, set License Number to "random"
    Then on Customs form, set Certificate Number to "random"
    Then on Customs form, set Invoice Number to "random"

    Then on Customs form, set Non-Delivery Options to Treat as abandoned
    Then on Customs form, set Non-Delivery Options to Return to sender

    Then on Customs form, set Internal Transaction Number to Required
    Then on Customs form, expect ITN Number is visible

    Then on Customs form, set Internal Transaction Number to Not required
    Then on Customs form, expect ITN Number is hidden

    Then on Customs form, set Internal Transaction Number to Required
    Then on Customs form, set ITN Number to "random"

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then on Order Details form, select service FCMI Large Envelope
    Then Sign out

