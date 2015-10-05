
Feature:  Printing Multiple Orders

  Background:
    Given I am signed in as a batch shipper ff

  @print_window @print @regression
  Scenario:  Printing
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    Then Expect Print Window title to be "You have 1 label(s) ready to print"

  @regression
  Scenario:  Printing
    And I Add a new order
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And Edit row 1 on the order grid
    And Edit row 2 on the order grid

    And Open Print Modal
    Then Expect Print Window title to be "You have 2 label(s) ready to print"

    Then Click Print Modal - Print button

