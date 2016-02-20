
Feature: Order Pagination

  Background:
    Given I am signed in to Orders

  @page_count @pagination
  Scenario: B-01746 Set per page count
    Then Toolbar:  Set Per Page drop-down to 100
    Then Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 250
    Then Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 500
    Then Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 250
    Then Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 100
    Then Expect number of orders on page to be correct
    Then Toolbar:  Set Per Page drop-down to 500
    Then Expect number of orders on page to be correct

    Then Sign out



