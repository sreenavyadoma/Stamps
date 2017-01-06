Feature: Print Media - Shipping Label: 5 ½" x 8 ½"

  Background:
    Given I am signed in to Orders

  @print_dialog_printing_on_5x8_shipping_label
  Scenario:  Shipping Label: 5 ½" x 8 ½"
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Package
    Then Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Sign out

