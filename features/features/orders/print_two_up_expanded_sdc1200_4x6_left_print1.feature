Feature: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 1 Domestic label on SDC-1200 4 ¼" x 6 ¾ right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Package, SDC-1200 Right Side 1, 5912 83rd St., Lubbock TX 79424-3608
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    Then Set Order Details Insure For to $1.09
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Print
    Then Sign out
