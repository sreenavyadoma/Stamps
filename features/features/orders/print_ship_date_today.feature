Feature: Set Print Ship Date to Today

  Background:
    Given I am signed in to Orders

  @print_ship_date_today
  Scenario: Set Ship Date to today
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Details: Set Ounces to 4
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Print: Open Modal
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Expect Ship Date for this order to be today
    Then Grid: Expect Date Printed for this order to be today
    Then Sign out


