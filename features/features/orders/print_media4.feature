Feature: Print Media - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"

  Background:
    Given I am signed in to Orders

  @print_media
  Scenario:  Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Sign out

