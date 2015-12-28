Feature: Date Printed - Today + 3

  Background:
    Given I am signed in to Orders

  @print_date @print_date_plus3
  Scenario: Set Ship Date to today + 3
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Ounces to 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Set Print Modal Ship Date to today plus 3
    Then Print
    Then Filter Shipped
    Then Expect Grid Date Printed for this order to be today
    Then Expect Grid Ship Date for this order to be today plus 3

    Then Sign out


