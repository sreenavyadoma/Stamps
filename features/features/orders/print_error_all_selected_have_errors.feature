
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given I am signed in to Orders

  @printing_error
  Scenario:  Printing
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Grid: Check row 1
    Then Print expecting error A Service must be selected before printing.

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Print expecting error All selected orders have errors and cannot be printed.

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    Then Sign out
