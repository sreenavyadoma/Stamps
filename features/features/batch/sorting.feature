Feature: Sorting.

  Background:
    Given I am signed in as a batch shipper gc/qacc/auto10/password1

  @styles @regression
  Scenario: Sorting
    Then Sort Order Grid Order ID in ascending order
    Then Sort Order Grid Order ID in descending order
