Feature: Print Media - Roll - 4" x 6" Shipping Label

  Background:
    Given I am signed in to Orders

  @print_dialog_printing_on_4x6_shipping_label
  Scenario:  Roll - 4" x 6" Shipping Label
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print: Print