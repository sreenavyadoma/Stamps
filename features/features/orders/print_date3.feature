Feature: Date Printed - Today + 2

  Background:
    Given I am signed in to Orders

  @print_date
  Scenario: Set Ship Date to today + 2
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Order Details - Set Ounces to 4
    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Print Modal - Set Printer to "factory"
    Then Print Modal - Set Ship Date to today plus 2
    Then Toolbar - Print
    Then Filter Panel - Shipped
    Then Expect Grid Date Printed for this order to be today
    Then Expect Grid Ship Date for this order to be today plus 2
    Then Sign out


