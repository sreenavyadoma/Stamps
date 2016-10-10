Feature: Add Hide Mail Value Checkbox to Print Dialog
  Add Hide Mail Value Checkbox to Print Dialog
  Move "Printing On" to top of the Print dialog

  Background:
    Given I am signed in to Orders

  @print_dialog_hide_postage_value
  Scenario:  Hide Mail Value Checkbox
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Flat Rate Envelope

    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Expect Printing On Label is Printing On:

    Then Print: Check Hide Mail Value
    Then Print: Expect Hide Mail Value Checkbox is checked
    Then Print: Close Modal
    Then Print: Open Modal
    Then Print: Expect Hide Mail Value Checkbox is checked
    Then Print: Uncheck Hide Mail Value
    Then Print: Check Hide Mail Value
    Then Print: Uncheck Hide Mail Value
    Then Print: Check Hide Mail Value
    Then Print: Uncheck Hide Mail Value
    Then Print: Print

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Print: Open Modal
    Then Print: Uncheck Hide Mail Value
    Then Print: Print

    Then Sign out

