Feature: B-01746 Order Pagination

  Background:
    Given A user is signed in to Orders as webbatch_0009/password1

#  @page_last_enabled
  Scenario:
    Then Pagination control to go to last page is enabled
    Then User clicks last page pagination control

    Then Sign out


  @page_last
  Scenario: Go to last page
    Then Set paging toolbar orders per page count to
    Then Web Batch grid has more orders than value selected in 'number of orders per page' pagination control
    Then Pagination control to go to last page is enabled
    Then User is not on the last page of orders
    Then User clicks last page pagination control
    Then User is taken to the first page of orders
    Then Server provides a new set of orders for the grid
    Then Set paging toolbar per page count to 100
    Then Expect page toolbar pagination count is correct

    Then Sign out

