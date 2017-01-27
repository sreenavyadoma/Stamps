Feature: International Shipping fields and Customs Information fields validation

  Background:
    Given a valid user is signed in to Web Apps

  @rules_international @rules_international_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to Japan

    Then On Order Details form, expect International Address fields are visible
    Then On Order Details form, expect Domestic Ship-To fields are hidden
    Then On Order Details form, expect Customs Restrictions button is visible
    Then On Order Details form, expect Customs Edit Form button is visible

    Then On Order Details International form, set address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then On Order Details form, set Ounces to 5
    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, Add Item 1, Qty 1, ID random, Description random

    Then On Order Details form, click Edit Form button

    Then On Customs form, set Package Contents to Commercial Sample
    Then On Customs form, expect More Info is hidden
    Then On Customs form, expect License Number is visible
    Then On Customs form, expect Certificate Number is visible
    Then On Customs form, expect Invoice Number is visible

    Then On Customs form, set Package Contents to Document
    Then On Customs form, expect More Info is visible
    Then On Customs form, expect License Number is hidden
    Then On Customs form, expect Certificate Number is hidden
    Then On Customs form, expect Invoice Number is hidden

    Then On Customs form, set Package Contents to Gift
    Then On Customs form, expect More Info is visible
    Then On Customs form, expect License Number is hidden
    Then On Customs form, expect Certificate Number is hidden
    Then On Customs form, expect Invoice Number is hidden

    Then On Customs form, set Package Contents to Humanitarian Donation
    Then On Customs form, expect More Info is visible
    Then On Customs form, expect License Number is hidden
    Then On Customs form, expect Certificate Number is hidden
    Then On Customs form, expect Invoice Number is hidden

    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, expect More Info is visible
    Then On Customs form, expect License Number is hidden
    Then On Customs form, expect Certificate Number is hidden
    Then On Customs form, expect Invoice Number is hidden

    Then On Customs form, set Package Contents to Returned Goods
    Then On Customs form, expect More Info is visible
    Then On Customs form, expect License Number is hidden
    Then On Customs form, expect Certificate Number is hidden
    Then On Customs form, expect Invoice Number is hidden

    Then On Customs form, set Package Contents to Commercial Sample
    Then On Customs form, expect More Info is hidden
    Then On Customs form, set License Number to "random"
    Then On Customs form, set Certificate Number to "random"
    Then On Customs form, set Invoice Number to "random"

    Then On Customs form, set Non-Delivery Options to Treat as abandoned
    Then On Customs form, set Non-Delivery Options to Return to sender

    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, expect ITN Number is visible

    Then On Customs form, set Internal Transaction Number to Not required
    Then On Customs form, expect ITN Number is hidden

    Then On Customs form, set Internal Transaction Number to Required
    Then On Customs form, set ITN Number to "random"

    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, select service FCMI Large Envelope
    Then Sign out

