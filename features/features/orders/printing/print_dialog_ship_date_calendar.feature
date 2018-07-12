
Feature: Set Print Ship Date up to 5 days from now in Calendar

  Background:
    Given user is signed in to Web Apps

  @print_dialog_ship_date_calendar
  Scenario: Set Ship Date to tomorrow
  # Ship Date today + 1
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to FCM Large Envelope/Flat
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 1
    Then expect print modal ship date is 1 day from today
    Then set print modal ship date to today plus 1
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect orders grid ship date is correct
    #Then expect orders grid date printed is correct
    Then sign out

  @print_dialog_ship_date_calendar
  Scenario: Set Ship Date to 2 days from now
  # Ship Date Today + 2
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to FCM Large Envelope/Flat
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 2
    Then expect print modal ship date is 2 days from today
    Then set print modal ship date to today plus 2
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    #Then expect orders grid date printed is correct
    Then expect orders grid ship date is correct
    Then sign out


  Scenario: Set Ship Date to 3 days from now
  # Ship Date Today + 3
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to FCM Large Envelope/Flat
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 2
    Then expect print modal ship date is 3 days from today
    Then set print modal ship date to today plus 3
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    #Then expect orders grid date printed is correct
    Then expect orders grid ship date is correct
    Then sign out


  Scenario: Set Ship Date to 4 days from now
      # Ship Date Today + 4
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to FCM Large Envelope/Flat
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 4
    Then expect print modal ship date is 4 days from today
    Then set print modal ship date to today plus 4
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    #Then expect orders grid date printed is correct
    Then expect orders grid ship date is correct
    Then sign out


  Scenario: Set Ship Date to 5 days from now
  # Ship Date Today + 5
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to FCM Large Envelope/Flat
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 5
    Then expect print modal ship date is 5 days from today
    Then set print modal ship date to today plus 5
    Then click print modal print button
    Then pause for 2 seconds
    Then select Filter Panel tab Shipped
    #Then expect orders grid date printed is correct
    Then expect orders grid ship date is correct
    Then sign out