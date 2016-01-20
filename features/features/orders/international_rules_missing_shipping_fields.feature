Feature: International Shipping fields and Customs Information fields validation

  Background:
    Given I am signed in to Orders

  @international_rules_engine @international_rules_engine_customs_fields_validation
  Scenario: International Shipping fields and Customs Information fields validation
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To Country to Japan

    Then Expect Order Details International Address fields are visible
    Then Expect Order Details Domestic Ship-To fields are hidden
    Then Expect Order Details Customs Restrictions button is visible
    Then Expect Order Details Customs Edit Form button is visible

    Then Order Details - Set Ship-To International Adress;
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |

    Then Order Details - Set Ounces to 5
    Then Order Details - Set Service to "Priority Mail International Flat Rate Envelope"
    Then Order Details - Add Item 1 - Qty 1, ID random, Description random
#todo-rob affected
    And Open Customs Form

    Then Customs Form - Set Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Expect Customs Form License# to be visible
    Then Expect Customs Form Certificate# to be visible
    Then Expect Customs Form Invoice# to be visible

    Then Customs Form - Set Package Contents to "Document"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Customs Form - Set Package Contents to "Gift"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Customs Form - Set Package Contents to "Humanitarian Donation"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Customs Form - Set Package Contents to "Merchandise"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Customs Form - Set Package Contents to "Returned Goods"
    Then Expect Customs Form More Info to be visible
    Then Expect Customs Form License# to be hidden
    Then Expect Customs Form Certificate# to be hidden
    Then Expect Customs Form Invoice# to be hidden

    Then Customs Form - Set Package Contents to "Commercial Sample"
    Then Expect Customs Form More Info to be hidden
    Then Customs Form - Set License# to "random"
    Then Customs Form - Set Certificate Number to "random"
    Then Customs Form - Set Invoice Number to "random"

    Then Customs Form - Set Non-Delivery Options to "Treat as abandoned"
    Then Customs Form - Set Non-Delivery Options to "Return to sender"

    Then Customs Form - Set Internal Transaction Number to "Required"
    Then Expect Customs Form ITN# to be visible

    Then Customs Form - Set Internal Transaction Number to "Not required"
    Then Expect Customs Form ITN# to be hidden

    Then Customs Form - Set Internal Transaction Number to "Required"
    Then Customs Form - Set ITN# to "random"

    Then Customs Form - Set I agree to Checked
    Then Close Customs Form
    Then Order Details - Set Service to "First-Class Mail International Large Envelope/Flat"
    And Sign out
