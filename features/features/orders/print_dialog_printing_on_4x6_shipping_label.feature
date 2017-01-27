Feature: Print Media - Roll - 4" x 6" Shipping Label

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_4x6_shipping_label
  Scenario:  Roll - 4" x 6" Shipping Label
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Pounds to 1
    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button