Feature: Print Media - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"

  Background:
    Given I am signed in to Orders

  @print_dialog_printing_on_4x6_sdc1200
  Scenario:  Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Package
    Then Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Sign out

