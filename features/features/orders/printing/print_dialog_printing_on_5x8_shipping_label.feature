Feature: Print Media - Shipping Label: 5 ½" x 8 ½"

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_printing_on_5x8_shipping_label
  Scenario:  Shipping Label: 5 ½" x 8 ½"
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then set order details pounds to 1
    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then click print modal print button
    Then sign out

