
Feature:  Printing Multiple Orders

  Background:
    Given I am signed in to Orders as ff

  @print_window @print
  Scenario:  Printing
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Expect Print Window title to be "You have 1 label(s) ready to print"

    And Sign out


  Scenario:  Printing
    And I Add a new order
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    And Edit row 1 on the order grid
    And Edit row 2 on the order grid

    Then Open Print Modal
    Then Expect Print Window title to be "You have 2 label(s) ready to print"

    Then Print

    And Sign out

