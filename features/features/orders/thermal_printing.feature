
Feature: Thermal Printer

  Background:
    Given I am signed in to Orders

  @thermal_printing
  Scenario:  As a batch shipper, I want to be able to change my print media
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Open Print Modal
    Then Print Modal: Set Media "Roll - 4" x 6" Shipping Label"
    Then Toolbar: Print
    And Sign out
