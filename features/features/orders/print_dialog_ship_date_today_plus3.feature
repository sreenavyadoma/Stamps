Feature: Set Print Ship Date to Today + 3

  Background:
    Given I am signed in to Orders

  @print_dialog_ship_date_today_plus3
  Scenario: Ship Date Today + 3
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To text area to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Details: Set Ounces to 4
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Set Ship Date to today plus 3
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Expect Date Printed for this order is today
    Then Grid: Expect Ship Date for this order is today plus 3

    Then Sign out


