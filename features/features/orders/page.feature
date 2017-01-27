
Feature: Order Pagination

  Background:
    Given a valid user is signed in to Web Apps

  @page_count @pagination
  Scenario: B-01746 Set per page count
    Then Paging: Set Per Page drop-down to 100
    Then In Orders Toolbar, expect number of orders on page is correct
    Then In Orders Toolbar,  Set Per Page drop-down to 250
    Then In Orders Toolbar, expect number of orders on page is correct
    Then In Orders Toolbar,  Set Per Page drop-down to 500
    Then In Orders Toolbar, expect number of orders on page is correct
    Then In Orders Toolbar,  Set Per Page drop-down to 250
    Then In Orders Toolbar, expect number of orders on page is correct
    Then Paging: Set Per Page drop-down to 100
    Then In Orders Toolbar, expect number of orders on page is correct
    Then In Orders Toolbar,  Set Per Page drop-down to 500
    Then In Orders Toolbar, expect number of orders on page is correct

    Then Sign out



