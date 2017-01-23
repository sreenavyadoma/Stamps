Feature: Add Hide Mail Value Checkbox to Print Dialog
  Add Hide Mail Value Checkbox to Print Dialog
  Move "Printing On" to top of the Print dialog

  Background:
    Given I am signed in to Orders

  @print_dialog_hide_postage_value
  Scenario:  Hide Mail Value Checkbox
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Flat Rate Envelope

    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Expect Printing On Label is Printing On:

    Then Print Modal: Check Hide Mail Value
    Then Print Modal: Expect Hide Mail Value Checkbox is checked
    Then Print Modal: Close Print Modal
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Hide Mail Value Checkbox is checked
    Then Print Modal: Uncheck Hide Mail Value
    Then Print Modal: Check Hide Mail Value
    Then Print Modal: Uncheck Hide Mail Value
    Then Print Modal: Check Hide Mail Value
    Then Print Modal: Uncheck Hide Mail Value
    Then Print Modal: Print

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Print Modal: Open Print Modal
    Then Print Modal: Uncheck Hide Mail Value
    Then Print Modal: Print

    Then Sign out

