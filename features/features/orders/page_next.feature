@regression
Feature: Order Pagination

  Background:
    Given A user is signed in to Orders

  @page_next
  Scenario: Go to next page

    Then Sign out
