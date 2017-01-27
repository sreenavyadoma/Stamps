Feature: Print Media - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_4x6_sdc1200
  Scenario:  Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then on Order Details form, set Pounds to 1
    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then Sign out

