Feature: Add Hide Mail Value CheckBox to Print Dialog
  Add Hide Mail Value CheckBox to Print Dialog
  Move "Printing On" to top of the Print dialog

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_hide_postage_value
  Scenario:  Hide Mail Value CheckBox
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Flat Rate Envelope

    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then expect Print modal Printing On Label is Printing On:

    Then in Print modal, check Hide Mail Value
    Then expect Print modal Hide Mail Value CheckBox is checked
    Then in Print modal, click Close button
    Then in Orders Toolbar, click Print button
    Then expect Print modal Hide Mail Value CheckBox is checked
    Then in Print modal, uncheck Hide Mail Value
    Then in Print modal, check Hide Mail Value
    Then in Print modal, uncheck Hide Mail Value
    Then in Print modal, check Hide Mail Value
    Then in Print modal, uncheck Hide Mail Value
    Then click print modal print button

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Flat Rate Envelope
    Then in Orders Toolbar, click Print button
    Then in Print modal, uncheck Hide Mail Value
    Then click print modal print button

    Then Sign out

