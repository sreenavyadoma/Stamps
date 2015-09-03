Feature: B-01746 Order Pagination

  Background:
    Given I am signed in as a batch shipper

  @page_enabled
  Scenario: Number of orders is > 'number of orders per page' pagination control
