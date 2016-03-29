
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # Checkbox

  Background:
    Given I am signed in to Orders

  @details_reference_no
  Scenario: Reference Number
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 2

    Then Details: Set Reference Number to random
    Then Details: Expect Reference Number to be random

    Then Details: Set Reference Number to Rob
    Then Details: Expect Reference Number to be Rob

    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Sign out

