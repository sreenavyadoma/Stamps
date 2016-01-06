Feature: International Shipping fields and Customs Information fields validation

  Background:
    Given I am signed in to Orders

  @international_rules_engine @international_rules_engine_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Set Order Details Ounces to 5
    Then Set Order Details Service to "Priority Mail International Flat Rate Envelope"

    Then Expect Order Details International Address fields are visible
    Then Expect Order Details Domestic Ship-To fields are hidden
    Then Expect Order Details Customs Restrictions button is visible
    Then Expect Order Details Customs Edit Form button is visible

    Then Set Order Details Item - Quantity 1, ID random, Description random

    And Open customs form

    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Expect Customs Form License# to be visible
    Then Expect Customs Form Certificate# to be visible
    Then Expect Customs Form Invoice# to be visible

    Then Set customs form Package Contents to "Document"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Gift"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Humanitarian Donation"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Merchandise"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Returned Goods"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Set customs form Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Set customs form License# to "random"
    Then Set customs form Certificate Number to "random"
    Then Set customs form Invoice Number to "random"

    Then Set customs form Non-Delivery Options to "Treat as abandoned"
    Then Set customs form Non-Delivery Options to "Return to sender"

    Then Set customs form Internal Transaction Number to "Required"
    Then Expect Customs Form ITN# to be visible

    Then Set customs form Internal Transaction Number to "Not required"
    Then Expect Customs Form ITN# to be hidden

    Then Set customs form Internal Transaction Number to "Required"
    Then Set customs form ITN# to "random"

    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Set Order Details Service to "First-Class Mail International Large Envelope/Flat"
    And Sign out
