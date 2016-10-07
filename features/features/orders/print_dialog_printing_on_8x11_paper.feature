Feature: Print Media - Shipping Label: 8 ½" x 11" Paper

  Background:
    Given I am signed in to Orders

  @print_dialog_printing_on_8x11_paper
  Scenario:  Shipping Label: 8 ½" x 11" Paper
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Sign out

