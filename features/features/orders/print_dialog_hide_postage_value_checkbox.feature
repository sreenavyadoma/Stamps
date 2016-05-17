Feature: Add Hide Postage Value Checkbox to Print Dialog
  Add Hide Postage Value Checkbox to Print Dialog
  Move "Printing On" to top of the Print dialog

  Background:
    Given I am signed in to Orders

  @print_dialog_hide_postage_value_checkbox
  Scenario:  Hide Postage Value Checkbox
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address in Zone 1
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Print: Open Modal
    Then Print: Expect Print Modal is present
    Then Print: Expect Printing On Label to be Printing On:
    Then Print: Close Modal
    Then Sign out

