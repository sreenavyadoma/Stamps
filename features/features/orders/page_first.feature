Feature: B-01746 Order Pagination

  Background:
    Given I am signed in to Orders as webbatch_0009/password1

  @page_first
  Scenario: Go to first page
    And Set paging toolbar orders per page count to 500
    Then Web Batch grid has more orders than value selected in 'number of orders per page' pagination control
    And Pagination control to go to first page is enabled
    And User is on the first page of orders
    And User clicks first page pagination control
    And User is taken to the first page of orders
    And Server provides a new set of orders for the grid
    And Set paging toolbar per page count to 100
    Then Expect page toolbar pagination count to be correct

    And Sign out

  @page_first_on_first_page
  Scenario: Go to first page - User is on first page
    Then Web Batch grid has more orders than value selected in 'number of orders per page' pagination control
    And User is on the first page of orders
    And Pagination control to go to first page is disabled
    And page control will state "Page 1 of x (where x is determined by server to be the last page)"

    And Sign out








