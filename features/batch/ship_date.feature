
Feature:  B-01630 Ship Date

  Background:
    Given I am signed in as a batch shipper

  @regression @ship_date
  Scenario:  Set Ship Date to today
    And I Add a new order
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 0 day(s) from today
    Then Expect Print Window Ship Date to be 0 day(s) from today
    Then Print
    And Sign out

  @regression @ship_date
  Scenario:  Set Ship Date to 1 day from today
    And I Add a new order
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 1 day(s) from today
    Then Expect Print Window Ship Date to be 1 day(s) from today
    Then Print
    And Sign out

  Scenario:  Set Ship Date to 1 day from today
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 2 day(s) from today
    Then Expect Print Window Ship Date to be 2 day(s) from today
    Then Print
    And Sign out

  @regression @ship_date
  Scenario:  Set Ship Date to 1 day from today
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    And Open Print Modal
    Then Set Ship Date Picker to 3 day(s) from today
    Then Expect Print Window Ship Date to be 3 day(s) from today
    Then Print
    And Sign out

