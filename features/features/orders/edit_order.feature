Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given I am signed in to Orders

  @edit_order
  Scenario: User edits an order

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 3
    Then Set Order Details Pounds to 2
    Then Set Order Details Insure For to $1.00
    Then Set Order Details Height to 1
    Then Set Order Details Length to 1
    Then Set Order Details Width to 1
    Then Uncheck Orders Grid row 1
    Then Check Orders Grid row 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 2
    Then Set Order Details Pounds to 1
    Then Set Order Details Insure For to $11.00
    Then Set Order Details Height to 2
    Then Set Order Details Length to 3
    Then Set Order Details Width to 4
    Then Uncheck Orders Grid row 1
    Then Check Orders Grid row 1
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Expect Grid Ounces to be 2
    Then Expect Grid Pounds to be 1
    Then Expect Grid Insured Value to be $11.00
    And Sign out
