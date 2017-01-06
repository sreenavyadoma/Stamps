Feature: Print Media - Roll - 4 ⅛" x 6 ¼" Shipping Label

  Background:
    Given I am signed in to Orders

  @print_dialog_printing_on_4x6_roll
  Scenario:  Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service PM Package
    Then Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Print: Open Modal
    Then Print: Set Printing On "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Print: Print
    Then Sign out

