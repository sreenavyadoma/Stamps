Feature: Set Print Ship Date to Today + 3

  Background:
    Given I am signed in to Orders

  @print_dialog_ship_date_today_plus3
  Scenario: Ship Date Today + 3
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details: Set Ounces to 4
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Set Ship Date to today plus 3
    Then Print Modal: Print
    Then Filter Panel: Select Shipped
    Then Orders Grid: Expect Date Printed for this order is today
    Then Orders Grid: Expect Ship Date for this order is today plus 3

    Then Sign out


