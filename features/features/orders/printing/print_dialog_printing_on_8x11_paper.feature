Feature: Print Media - Shipping Label: 8 ½" x 11" Paper

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_8x11_paper
  Scenario:  Shipping Label: 8 ½" x 11" Paper
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then sign out


