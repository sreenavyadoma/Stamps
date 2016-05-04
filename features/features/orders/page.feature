
Feature: Order Pagination

  Background:
    Given I am signed in to Orders

  @page_count @pagination
  Scenario: B-01746 Set per page count
    Then Paging: Set Per Page drop-down to 100
    Then Toolbar: Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 250
    Then Toolbar: Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 500
    Then Toolbar: Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 250
    Then Toolbar: Expect number of orders on page to be correct
    Then Paging: Set Per Page drop-down to 100
    Then Toolbar: Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 500
    Then Toolbar: Expect number of orders on page to be correct

    Then Sign out



