
Feature: Ship Date

  Background:
    Given I am signed in to Orders

  @ship_date
  Scenario:  Print: Set Ship Date to today
    Then Toolbar: Add
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today
    Then Expect Shipped Tab Ship Date to be today
    Then Print: Print
    Then Sign out


  @ship_date
  Scenario:  Print: Set Ship Date to 1 day from today
    Then Toolbar: Add
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 1
    Then Print: Set Ship Date to today plus 3
    Then Print: Print
    Then Sign out


  @ship_date
  Scenario:  Print: Set Ship Date to 1 day from today
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 2
    Then Expect Shipped Tab Ship Date to be today plus 2
    Then Print: Print
    Then Sign out


  @ship_date
  Scenario:  Print: Set Ship Date to 1 day from today
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Print: Open Modal
    Then Print: Set Ship Date to today plus 3
    Then Expect Shipped Tab Ship Date to be today plus 3
    Then Print: Print
    Then Sign out


