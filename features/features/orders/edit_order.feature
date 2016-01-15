Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given I am signed in to Orders

  @edit_order
  Scenario: User edits an order

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Weight to 4 lbs 2 oz
    Then Set Order Details Insure For to $1.00
    Then Set Order Details Dimensions to Length 1 Width 1 Height 1
    Then Uncheck Orders Grid row 1
    Then Check Orders Grid row 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Weight to 1 lbs 4 oz
    Then Set Order Details Insure For to $11.00
    Then Set Order Details Dimensions to Length 2 Width 2 Height 2
    Then Uncheck Orders Grid row 1
    Then Check Orders Grid row 1
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Expect Grid Ounces to be 4
    Then Expect Grid Pounds to be 1
    Then Expect Grid Insured Value to be $11.00
    And Sign out
