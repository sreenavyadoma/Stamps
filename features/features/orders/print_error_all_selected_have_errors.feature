
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given I am signed in to Orders as ff/qacc/auto01/326tsetaqcdS!

  @printing_error
  Scenario:  Printing
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    And Orders Grid: Check row 1
    Then Print expecting error A Service must be selected before printing.

    Then Add New Order
    Then Order Details: Set Ship-From to default
    And Orders Grid: Check row 1
    And Orders Grid: Check row 2
    Then Print expecting error All selected orders have errors and cannot be printed.

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Hide Ship-To fields
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Service to "Priority Mail Regional Rate Box A"
    And Orders Grid: Check row 1
    And Orders Grid: Check row 2
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    And Sign out
