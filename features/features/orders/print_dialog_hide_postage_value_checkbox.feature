Feature: Add Hide Mail Value Checkbox to Print Dialog
  Add Hide Mail Value Checkbox to Print Dialog
  Move "Printing On" to top of the Print dialog

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_hide_postage_value
  Scenario:  Hide Mail Value Checkbox
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, expect Printing On Label is Printing On:

    Then in Print modal, check Hide Mail Value
    Then in Print modal, expect Hide Mail Value Checkbox is checked
    Then in Print modal, click Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Hide Mail Value Checkbox is checked
    Then in Print modal, uncheck Hide Mail Value
    Then in Print modal, check Hide Mail Value
    Then in Print modal, uncheck Hide Mail Value
    Then in Print modal, check Hide Mail Value
    Then in Print modal, uncheck Hide Mail Value
    Then in Print modal, click Print button

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1
    Then on Order Details form, select service PM Flat Rate Envelope
    Then in Orders Toolbar, click Print button
    Then in Print modal, uncheck Hide Mail Value
    Then in Print modal, click Print button

    Then Sign out

