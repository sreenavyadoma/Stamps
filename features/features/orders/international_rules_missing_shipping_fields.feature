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

    Then click Order Details form Edit Form button

    Then set Customs form Package Contents to Commercial Sample
    Then expect Customs form More Info is hidden
    Then expect Customs form License Number is visible
    Then expect Customs form Certificate Number is visible
    Then expect Customs form Invoice Number is visible

    Then set Customs form Package Contents to Document
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Gift
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Humanitarian Donation
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Merchandise
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Returned Goods
    Then expect Customs form More Info is visible
    Then expect Customs form License Number is hidden
    Then expect Customs form Certificate Number is hidden
    Then expect Customs form Invoice Number is hidden

    Then set Customs form Package Contents to Commercial Sample
    Then expect Customs form More Info is hidden
    Then set Customs form License Number to random
    Then set Customs form Certificate Number to random
    Then set Customs form Invoice Number to random

    Then set Customs form Non-Delivery Options to Treat as abandoned
    Then set Customs form Non-Delivery Options to Return to sender

    Then set Customs form Internal Transaction Number to Required
    Then expect Customs form ITN Number is visible

    Then set Customs form Internal Transaction Number to Not required
    Then expect Customs form ITN Number is hidden

    Then set Customs form Internal Transaction Number to Required
    Then set Customs form ITN Number to random

    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, select service FCMI Large Envelope
    Then Sign out

