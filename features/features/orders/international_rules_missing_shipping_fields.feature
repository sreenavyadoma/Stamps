Feature: International Shipping fields and Customs Information fields validation

  Background:
    Given I am signed in to Orders

  @rules_international @rules_international_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to Japan

    Then Details: Expect International Address fields are visible
    Then Details: Expect Domestic Ship-To fields are hidden
    Then Details: Expect Customs Restrictions button is visible
    Then Details: Expect Customs Edit Form button is visible

    Then Details: Set Ship-To address to
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Details: Set Ounces to 5
    Then Details: Set Service to "Priority Mail International Flat Rate Envelope"
    Then Details: Add Item 1, Qty 1, ID random, Description random

    Then Details: Edit Customs Form

    Then Customs: Set Package Contents to "Commercial Sample"
    Then Customs: Expect More Info to be hidden
    Then Customs: Expect License Number to be visible
    Then Customs: Expect Certificate Number to be visible
    Then Customs: Expect Invoice Number to be visible

    Then Customs: Set Package Contents to "Document"
    Then Customs: Expect More Info to be visible
    Then Customs: Expect License Number to be hidden
    Then Customs: Expect Certificate Number to be hidden
    Then Customs: Expect Invoice Number to be hidden

    Then Customs: Set Package Contents to "Gift"
    Then Customs: Expect More Info to be visible
    Then Customs: Expect License Number to be hidden
    Then Customs: Expect Certificate Number to be hidden
    Then Customs: Expect Invoice Number to be hidden

    Then Customs: Set Package Contents to "Humanitarian Donation"
    Then Customs: Expect More Info to be visible
    Then Customs: Expect License Number to be hidden
    Then Customs: Expect Certificate Number to be hidden
    Then Customs: Expect Invoice Number to be hidden

    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Expect More Info to be visible
    Then Customs: Expect License Number to be hidden
    Then Customs: Expect Certificate Number to be hidden
    Then Customs: Expect Invoice Number to be hidden

    Then Customs: Set Package Contents to "Returned Goods"
    Then Customs: Expect More Info to be visible
    Then Customs: Expect License Number to be hidden
    Then Customs: Expect Certificate Number to be hidden
    Then Customs: Expect Invoice Number to be hidden

    Then Customs: Set Package Contents to "Commercial Sample"
    Then Customs: Expect More Info to be hidden
    Then Customs: Set License Number to "random"
    Then Customs: Set Certificate Number to "random"
    Then Customs: Set Invoice Number to "random"

    Then Customs: Set Non-Delivery Options to "Treat as abandoned"
    Then Customs: Set Non-Delivery Options to "Return to sender"

    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Expect ITN Number to be visible

    Then Customs: Set Internal Transaction Number to "Not required"
    Then Customs: Expect ITN Number to be hidden

    Then Customs: Set Internal Transaction Number to "Required"
    Then Customs: Set ITN Number to "random"

    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Form
    Then Details: Set Service to "First-Class Mail International Large Envelope/Flat"
    Then Sign out
