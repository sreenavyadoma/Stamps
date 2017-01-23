
Feature: Ship Date

  Background:
    Given I am signed in to Orders

  @ship_date
  Scenario:  Print Modal: Set Ship Date to today
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Ship Date to today
    Then Filter Panel: Expect Shipped Tab Ship Date is today
    Then Print Modal: Print
    Then Sign out


  @ship_date
  Scenario:  Print Modal: Set Ship Date to 1 day from today
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Ship Date to today plus 1
    Then Print Modal: Set Ship Date to today plus 3
    Then Print Modal: Print
    Then Sign out


  @ship_date
  Scenario:  Print Modal: Set Ship Date to 1 day from today
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Ship Date to today plus 2
    Then Filter Panel: Expect Shipped Tab Ship Date is today plus 2
    Then Print Modal: Print
    Then Sign out


  @ship_date
  Scenario:  Print Modal: Set Ship Date to 1 day from today
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Ship Date to today plus 3
    Then Filter Panel: Expect Shipped Tab Ship Date is today plus 3
    Then Print Modal: Print
    Then Sign out


