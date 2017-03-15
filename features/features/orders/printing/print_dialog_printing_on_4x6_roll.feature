Feature: Print Media - Roll - 4 ⅛" x 6 ¼" Shipping Label

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_4x6_roll
  Scenario:  Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then set Order Details form Pounds to 1
    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then in Print modal, click Print button
    Then Sign out

