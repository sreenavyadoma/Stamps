
Feature: Order Pagination

  Background:
    Given a valid user is signed in to Web Apps

  @page_count @pagination
  Scenario: B-01746 Set per page count
    Then Paging: Set Per Page drop-down to 100
    Then in Orders Toolbar, expect number of orders on page is correct
    Then in Orders Toolbar, set Per Page drop-down to 250
    Then in Orders Toolbar, expect number of orders on page is correct
    Then in Orders Toolbar, set Per Page drop-down to 500
    Then in Orders Toolbar, expect number of orders on page is correct
    Then in Orders Toolbar, set Per Page drop-down to 250
    Then in Orders Toolbar, expect number of orders on page is correct
    Then Paging: Set Per Page drop-down to 100
    Then in Orders Toolbar, expect number of orders on page is correct
    Then in Orders Toolbar, set Per Page drop-down to 500
    Then in Orders Toolbar, expect number of orders on page is correct

    Then Sign out



