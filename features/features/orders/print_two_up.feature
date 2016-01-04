
Feature:  As a batch shipper, I want to be able to print two labels on one sheet

  Background:
    Given I am signed in to Orders

  @print_two_up
  Scenario: User Prints multiple Domestic labels

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 3

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 2

    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid

    Then Open Print Modal
    Then Set Print Modal Printer to "factory"
    Then Select Print Media "Shipping Label - 5 ½" x 8 ½""

    Then Select Print Modal right-side label
    And Expect Print Modal right-side label selected
    Then Expect Print Window requires 2 label sheets
    Then Print

    Then Sign out








