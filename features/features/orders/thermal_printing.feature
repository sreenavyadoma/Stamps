
Feature: Thermal Printer

  Background:
    Given I am signed in to Orders

  @print_on_thermal
  Scenario:  As a batch shipper, I want is able to change my print media
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 5 through 8
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print Modal: Print
    Then Sign out

