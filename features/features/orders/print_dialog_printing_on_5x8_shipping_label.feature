Feature: Print Media - Shipping Label: 5 ½" x 8 ½"

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_5x8_shipping_label
  Scenario:  Shipping Label: 5 ½" x 8 ½"
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Pounds to 1
    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then Sign out

