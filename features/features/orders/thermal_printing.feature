
Feature: Thermal Printer

  Background:
    Given I am signed in to Orders

  @print_on_thermal
  Scenario:  As a batch shipper, I want to be able to change my print media
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 5 through 8
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Length to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print: Print
    Then Sign out

