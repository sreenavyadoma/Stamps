Feature: Print Media - Shipping Label: 8 ½" x 11" Paper

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_8x11_paper
  Scenario:  Shipping Label: 8 ½" x 11" Paper
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Ounces to 1
    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then Sign out

