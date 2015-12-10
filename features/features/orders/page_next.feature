@regression
Feature: Order Pagination

  Background:
    Given I am signed in to Orders

  @page_next
  Scenario: Go to next page

    And Sign out
