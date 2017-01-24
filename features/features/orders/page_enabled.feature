Feature: B-01746 Order Pagination

  Background:
    Given A user is signed in to Orders

  @page_enabled
  Scenario: Number of orders is > 'number of orders per page' pagination control

    Then Sign out
