Feature: Print Media - Shipping Label: 5 ½" x 8 ½"

  Background:
    Given I am signed in to Orders

  @print_media_5x8_shipping_label
  Scenario:  Shipping Label: 5 ½" x 8 ½"
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Sign out

