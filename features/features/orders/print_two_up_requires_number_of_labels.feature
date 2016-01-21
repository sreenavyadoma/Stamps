
Feature:  Requires x-number of label sheets

  Background:
    Given I am signed in to Orders

  @print_two_up
  Scenario:  Printing
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details - Set Weight to 1 lbs 1 oz
    Then Open Print Modal
    Then Expect Print Window Requires 1 label sheets
    Then Close Print Modal

    Then Add New Order
    Then Order Details - Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details - Set Weight to 1 lbs 1 oz
    Then Order Details - Set Dimensions to Length 1 Width 1 Height 1
    And Orders Grid - Check row 1
    And Orders Grid - Check row 2
    Then Open Print Modal
    Then Expect Print Window Requires 2 label sheets
    Then Close Print Modal

    And Sign out
