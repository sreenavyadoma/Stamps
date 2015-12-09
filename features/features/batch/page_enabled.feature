Feature: B-01746 Order Pagination

  Background:
    Given I am signed in to Orders

  @page_enabled
  Scenario: Number of orders is > 'number of orders per page' pagination control

    And Sign out
