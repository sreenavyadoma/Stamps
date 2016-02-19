Feature: B-01746 Order Pagination

  Background:
    Given I am signed in to Orders

  @page_disabled
  Scenario: Less Than 100 orders on a page
    * Web Batch grid has < 100 orders
    Then Expect page toolbar First Page is disabled
    Then Expect page toolbar Previous Page is disabled
    * pagination control to go to specific page is disabled
    Then Expect page toolbar Next Page is disabled
    Then Expect page toolbar Last Page is disabled
    * User is still able to set number of orders per page (100, 250, or 500)

    Then Sign out
