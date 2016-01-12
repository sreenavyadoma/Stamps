
Feature:  Requires x-number of label sheets

  Background:
    Given I am signed in to Orders

  @print_two_up
  Scenario:  Printing
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Weight to 1 lbs 1 oz
    Then Open Print Modal
    Then Expect Print Window Requires 1 label sheets
    Then Close Print Modal

    When I Add a new order
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Weight to 1 lbs 1 oz
    Then Set Order Details Dimensions to Length 1 Width 1 Height 1
    And Check Orders Grid row 1
    And Check Orders Grid row 2
    Then Open Print Modal
    Then Expect Print Window Requires 2 label sheets
    Then Close Print Modal

    And Sign out
