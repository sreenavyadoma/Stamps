Feature: Print Media - Shipping Label: 8 ½" x 11" Paper

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_8x11_paper
  Scenario:  Shipping Label: 8 ½" x 11" Paper
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1
    Then Pause for 2 seconds
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then Sign out


