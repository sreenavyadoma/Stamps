Feature: Print 2 Domestic labels on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 2 Domestic labels on 5.5x8.5 - right side

    # 2 Domestic labels 5 ½" x 8 ½" right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then Set Order Details Service to "Media Mail Package"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Large Package, 5.5x8.5 Right Side 1, 26930 NE 152nd St., Duvall WA 98019-8316
    Then Set Order Details Service to "Priority Mail Large Package"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 2 label sheets
    Then Print
    Then Sign out
