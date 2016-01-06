
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given I am signed in to Orders as ff/qacc/auto01/326tsetaqcdS!

  @printing_error
  Scenario:  Printing
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    And Edit row 1 on the Orders Grid
    Then Print expecting error A Service must be selected before printing.

    And I Add a new order
    Then Set Order Details Ship-From to default
    And Edit row 1 on the Orders Grid
    And Edit row 2 on the Orders Grid
    Then Print expecting error All selected orders have errors and cannot be printed.

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Pounds to 1
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    And Edit row 1 on the Orders Grid
    And Edit row 2 on the Orders Grid
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    And Sign out
