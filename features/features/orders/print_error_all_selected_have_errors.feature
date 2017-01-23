
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given I am signed in to Orders

  @printing_error
  Scenario:  Printing
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Orders Grid: Check row 1
    Then Print expecting error A Service must be selected before printing.

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Print expecting error All selected orders have errors and cannot be printed.

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Regional Rate Box A
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    Then Sign out
