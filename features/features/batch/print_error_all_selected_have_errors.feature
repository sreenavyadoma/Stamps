
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given I am signed in as a batch shipper ff/qacc/auto01/326tsetaqcdS!

  @printing_error @regression
  Scenario:  Printing
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Edit row 1 on the order grid
    Then Print expecting error A Service must be selected before printing.

    And I Add a new order
    Then Set single-order form Ship-From to default
    And Edit row 1 on the order grid
    And Edit row 2 on the order grid
    Then Print expecting error All selected orders have errors and cannot be printed.

    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Pounds to 1
    Then Set single-order form Ounces to 1
    Then Set single-order form Service to "Priority Mail Regional Rate Box A"
    And Edit row 1 on the order grid
    And Edit row 2 on the order grid
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    And Sign out
