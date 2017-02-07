Feature: Set Print Ship Date to Today + 3

  Background:
    Given a valid user is signed in to Web Apps

  @print_dialog_ship_date_today_plus3
  Scenario: Ship Date Today + 3
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then on Order Details form, set Ounces to 4
    Then on Order Details form, select service PM Flat Rate Envelope
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, set Ship Date to today plus 3
    Then in Print modal, click Print button
    Then In left Filter Panel, select Shipped
    Then in Orders Grid, expect Date Printed for this order is today
    Then in Orders Grid, expect Ship Date for this order is today plus 3

    Then Sign out


