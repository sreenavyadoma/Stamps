Feature: Set Print Ship Date to Today + 2

  Background:
    Given A user is signed in to Orders

  @print_dialog_ship_date_today_plus2
  Scenario: Ship Date Today + 2
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then On Order Details form, set Ounces to 4
    Then On Order Details form, select service PM Flat Rate Envelope
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, set Ship Date to today plus 2
    Then In Print modal, click Print button
    Then In left filter panel, select Shipped
    Then In Orders Grid, expect Date Printed for this order is today
    Then In Orders Grid, expect Ship Date for this order is today plus 2
    Then Sign out
