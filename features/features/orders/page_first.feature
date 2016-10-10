Feature: B-01746 Order Pagination

  Background:
    Given I am signed in to Orders as webbatch_0009/password1

  @page_first
  Scenario: Go to first page
    Then Toolbar:  Set Per Page drop-down to 500
    Then Web Batch grid has more orders than value selected in 'number of orders per page' pagination control
    Then Pagination control to go to first page is enabled
    Then User is on the first page of orders
    Then User clicks first page pagination control
    Then User is taken to the first page of orders
    Then Server provides a new set of orders for the grid
    Then Set paging toolbar per page count to 100
    Then Expect page toolbar pagination count is correct

    Then Sign out

  @page_first_on_first_page
  Scenario: Go to first page - User is on first page
    Then Web Batch grid has more orders than value selected in 'number of orders per page' pagination control
    Then User is on the first page of orders
    Then Pagination control to go to first page is disabled
    Then page control will state "Page 1 of x (where x is determined by server is the last page)"

    Then Sign out








