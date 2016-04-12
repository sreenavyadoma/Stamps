Feature: Multiple Reprints

  Background:
    Given I am signed in to Orders

  @print_multiple_reprints
  Scenario: Multiple reprints in 24 hour period

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Details: Set Service to "Media Mail Package"
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Check New Order ID
    Then Print: Open Reprint Modal
    Then RePrint: Reprint
    Then Filter: Select Shipped
    Then Grid: Check New Order ID
    Then Print: Open Reprint Modal
    Then RePrint: Reprint

    Then Sign out