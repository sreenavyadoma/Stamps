
Feature:  Requires x-number of label sheets

  Background:
    Given I am signed in to Orders

  @print_modal_label_count_thermal
  Scenario:  Printing
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Weight to 1 lbs 1 oz
    Then Open Print Modal
    Then Print: Expect number of required label sheets to be 1
    Then Print: Expect Modal Title to be "You have 1 label(s) ready to print"
    Then Close Print Modal

    Then Add New Order
    Then Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Weight to 1 lbs 1 oz
    Then Details: Set Dimensions to Length 1 Width 1 Height 1


    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Details: Set Weight to 1 lbs 1 oz

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3

    Then Open Print Modal
    Then Print: Set Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Pause for 1 second
    Then Print: Expect number of required label sheets to be 3
    Then Close Print Modal

    Then Sign out
