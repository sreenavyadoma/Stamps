Feature: Add Hide Mail Value Checkbox to Print Dialog
  Add Hide Mail Value Checkbox to Print Dialog
  Move "Printing On" to top of the Print dialog

  Background:
    Given A user is signed in to Orders

  @print_dialog_hide_postage_value
  Scenario:  Hide Mail Value Checkbox
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1
    Then On Order Details form, select service PM Flat Rate Envelope

    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, expect Printing On Label is Printing On:

    Then In Print modal, check Hide Mail Value
    Then In Print modal, expect Hide Mail Value Checkbox is checked
    Then In Print modal, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Hide Mail Value Checkbox is checked
    Then In Print modal, uncheck Hide Mail Value
    Then In Print modal, check Hide Mail Value
    Then In Print modal, uncheck Hide Mail Value
    Then In Print modal, check Hide Mail Value
    Then In Print modal, uncheck Hide Mail Value
    Then In Print modal, click Print button

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1
    Then On Order Details form, select service PM Flat Rate Envelope
    Then In Orders Toolbar, click Print button
    Then In Print modal, uncheck Hide Mail Value
    Then In Print modal, click Print button

    Then Sign out

