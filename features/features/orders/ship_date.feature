
Feature: Ship Date

  Background:
    Given I am signed in to Orders

  @ship_date
  Scenario:  Print: Set Ship Date to today
    Then Toolbar: Add
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today
    Then Left Panel: Expect Shipped Tab Ship Date is today
    Then Print: Print
    Then Sign out


  @ship_date
  Scenario:  Print: Set Ship Date to 1 day from today
    Then Toolbar: Add
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 1
    Then Print: Set Ship Date to today plus 3
    Then Print: Print
    Then Sign out


  @ship_date
  Scenario:  Print: Set Ship Date to 1 day from today
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 2
    Then Left Panel: Expect Shipped Tab Ship Date is today plus 2
    Then Print: Print
    Then Sign out


  @ship_date
  Scenario:  Print: Set Ship Date to 1 day from today
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 3
    Then Left Panel: Expect Shipped Tab Ship Date is today plus 3
    Then Print: Print
    Then Sign out


