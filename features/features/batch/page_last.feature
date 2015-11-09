Feature: B-01746 Order Pagination

  Background:
    Given I am signed in as a batch shipper webbatch_0009/password1

#  @page_last_enabled
  Scenario:
    And Pagination control to go to last page is enabled
    Then User clicks last page pagination control

    And Sign out


  @page_last
  Scenario: Go to last page
    And Set paging toolbar orders per page count to
    Then Web Batch grid has more orders than value selected in 'number of orders per page' pagination control
    And Pagination control to go to last page is enabled
    And User is not on the last page of orders
    And User clicks last page pagination control
    And User is taken to the first page of orders
    And Server provides a new set of orders for the grid
    And Set paging toolbar per page count to 100
    Then Expect page toolbar pagination count to be correct

    And Sign out

