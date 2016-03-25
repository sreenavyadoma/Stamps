Feature: Date Printed - Today + 3

  Background:
    Given I am signed in to Orders

  @print_date @print_date_plus3
  Scenario: Set Ship Date to today + 3
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Details: Set Ounces to 4
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Print: Set Printer to "factory"
    Then Print: Set Ship Date to today plus 3
    Then Toolbar: Print
    Then Filter: Select Shipped
    Then Grid: Expect Date Printed for this order to be today
    Then Grid: Expect Ship Date for this order to be today plus 3

    Then Sign out


