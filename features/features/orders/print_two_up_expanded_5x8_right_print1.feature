Feature: User Prints 1 Domestic label on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 1 Domestic label on 5.5x8.5 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PS Package, 5.5x8.5 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Set Order Details Service to "Parcel Select Ground Package"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out
