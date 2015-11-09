
Feature:  Printing Multiple Orders

  Background:
    Given I am signed in as a batch shipper ff

  @print_window @print
  Scenario:  Printing
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    Then Set Order Form Service to "Priority Mail Package"
    And Open Print Modal
    Then Expect Print Window title to be "You have 1 label(s) ready to print"

    And Sign out


  Scenario:  Printing
    And I Add a new order
    Then Set Order Form Ship-To address to random
    Then Set Order Form Service to "Priority Mail Package"
    And Edit row 1 on the order grid
    And Edit row 2 on the order grid

    And Open Print Modal
    Then Expect Print Window title to be "You have 2 label(s) ready to print"

    Then Print

    And Sign out

