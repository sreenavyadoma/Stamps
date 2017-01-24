Feature: Print Media - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"

  Background:
    Given A user is signed in to Orders

  @print_dialog_printing_on_4x6_sdc1200
  Scenario:  Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Pounds to 1
    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then Sign out

