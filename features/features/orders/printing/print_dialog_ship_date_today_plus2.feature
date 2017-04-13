Feature: Set Print Ship Date to Today + 2

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_ship_date_today_plus2
  Scenario: Ship Date Today + 2
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set Order Details form Ounces to 4
    Then set Order Details form service to PM Flat Rate Envelope
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then set Print modal Ship Date to today plus 2
    Then in Print modal, click Print button
    Then In left Filter Panel, select Shipped
    Then expect Orders Grid Date Printed for this order is today
    Then expect Orders Grid Ship Date for this order is today plus 2
    Then Sign out
