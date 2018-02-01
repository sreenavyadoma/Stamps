
Feature: Set Print Ship Date up to 5 days from now in Calendar

  Background:
    Given user is signed in to Web Apps

  @print_dialog_ship_date_calendar
  Scenario: Set Ship Date to tomorrow
  # Ship Date today + 1
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to FCM Large Envelope/Flat
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 1
    Then expect Print modal Ship Date is 1 day from today
    Then set Print modal Ship Date to today plus 1

    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Ship Date for this order is correct
    Then expect Orders Grid Date Printed for this order is correct
    Then Sign out

  @print_dialog_ship_date_calendar
  Scenario: Set Ship Date to 2 days from now
  # Ship Date Today + 2
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to FCM Large Envelope/Flat
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 2
    Then expect Print modal Ship Date is 2 days from today
    Then set Print modal Ship Date to today plus 2
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct
    Then Sign out


  Scenario: Set Ship Date to 3 days from now
  # Ship Date Today + 3
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to FCM Large Envelope/Flat
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 2
    Then expect Print modal Ship Date is 3 days from today
    Then set Print modal Ship Date to today plus 3
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct
    Then Sign out


  Scenario: Set Ship Date to 4 days from now
      # Ship Date Today + 4
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to FCM Large Envelope/Flat
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 4
    Then expect Print modal Ship Date is 4 days from today
    Then set Print modal Ship Date to today plus 4
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct
    Then Sign out


  Scenario: Set Ship Date to 5 days from now
  # Ship Date Today + 5
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to FCM Large Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details Ounces to 4
    Then set Order Details service to FCM Large Envelope/Flat
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then set Print modal Ship Date Calendar to today plus 5
    Then expect Print modal Ship Date is 5 days from today
    Then set Print modal Ship Date to today plus 5
    Then click print modal print button
    Then Pause for 2 seconds
    Then select Filter Panel tab Shipped
    Then expect Orders Grid Date Printed for this order is correct
    Then expect Orders Grid Ship Date for this order is correct
    Then Sign out