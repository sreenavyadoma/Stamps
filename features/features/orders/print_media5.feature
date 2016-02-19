Feature: Print Media - Shipping Label: 8 ½" x 11" Paper

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Shipping Label: 8 ½" x 11" Paper
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1
    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    Then Sign out

