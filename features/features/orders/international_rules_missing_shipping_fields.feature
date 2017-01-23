Feature: International Shipping fields and Customs Information fields validation

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to Japan

    Then Order Details: Expect International Address fields are visible
    Then Order Details: Expect Domestic Ship-To fields are hidden
    Then Order Details: Expect Customs Restrictions button is visible
    Then Order Details: Expect Customs Edit Form button is visible

    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Order Details: Set Ounces to 5
    Then Order Details: Select Service PMI Flat Rate Envelope
    Then Order Details: Add Item 1, Qty 1, ID random, Description random

    Then Order Details: Edit Customs Form

    Then Customs Form: Set Package Contents to Commercial Sample
    Then Customs Form: Expect More Info is hidden
    Then Customs Form: Expect License Number is visible
    Then Customs Form: Expect Certificate Number is visible
    Then Customs Form: Expect Invoice Number is visible

    Then Customs Form: Set Package Contents to Document
    Then Customs Form: Expect More Info is visible
    Then Customs Form: Expect License Number is hidden
    Then Customs Form: Expect Certificate Number is hidden
    Then Customs Form: Expect Invoice Number is hidden

    Then Customs Form: Set Package Contents to Gift
    Then Customs Form: Expect More Info is visible
    Then Customs Form: Expect License Number is hidden
    Then Customs Form: Expect Certificate Number is hidden
    Then Customs Form: Expect Invoice Number is hidden

    Then Customs Form: Set Package Contents to Humanitarian Donation
    Then Customs Form: Expect More Info is visible
    Then Customs Form: Expect License Number is hidden
    Then Customs Form: Expect Certificate Number is hidden
    Then Customs Form: Expect Invoice Number is hidden

    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Expect More Info is visible
    Then Customs Form: Expect License Number is hidden
    Then Customs Form: Expect Certificate Number is hidden
    Then Customs Form: Expect Invoice Number is hidden

    Then Customs Form: Set Package Contents to Returned Goods
    Then Customs Form: Expect More Info is visible
    Then Customs Form: Expect License Number is hidden
    Then Customs Form: Expect Certificate Number is hidden
    Then Customs Form: Expect Invoice Number is hidden

    Then Customs Form: Set Package Contents to Commercial Sample
    Then Customs Form: Expect More Info is hidden
    Then Customs Form: Set License Number to "random"
    Then Customs Form: Set Certificate Number to "random"
    Then Customs Form: Set Invoice Number to "random"

    Then Customs Form: Set Non-Delivery Options to Treat as abandoned
    Then Customs Form: Set Non-Delivery Options to Return to sender

    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Expect ITN Number is visible

    Then Customs Form: Set Internal Transaction Number to Not required
    Then Customs Form: Expect ITN Number is hidden

    Then Customs Form: Set Internal Transaction Number to Required
    Then Customs Form: Set ITN Number to "random"

    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Order Details: Select Service FCMI Large Envelope
    Then Sign out

