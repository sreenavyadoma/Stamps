Feature: Print Media - Shipping Label: 5 ½" x 8 ½"

  Background:
    Given A user is signed in to Orders

  @print_dialog_printing_on_5x8_shipping_label
  Scenario:  Shipping Label: 5 ½" x 8 ½"
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Pounds to 1
    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then Sign out

