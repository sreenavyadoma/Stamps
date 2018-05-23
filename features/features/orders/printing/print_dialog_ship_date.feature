Feature: Set Print Ship Date to Today

  Background:
    Given user is signed in to Web Apps

  @print_dialog_ship_date
  Scenario: Set Ship Date to today

  # Ship Date today
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then set print modal ship date to today
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Ship Date for this order is correct
    Then expect Orders Grid Date Printed for this order is correct

  # Ship Date today + 1
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set print modal ship date to today plus 1
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Ship Date for this order is correct
    Then expect Orders Grid Date Printed for this order is correct

  # Ship Date Today + 2
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set print modal ship date to today plus 2
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct

  # Ship Date Today + 3
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set print modal ship date to today plus 3
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct
    Then sign out

    