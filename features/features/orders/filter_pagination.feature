Feature: As a batch shipper, I want to be able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

  Scenario: User Views Filter Panel - Panel Default
    When Expect system displays expanded filters panel

    Then Filter: Select Shipped
    Then Filter: Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Toolbar:  Set Per Page drop-down to 500
    Then Toolbar: Expect number of orders on page to be correct
    Then Paging: Expect Total Number of Pages to be 2
    Then Toolbar:  Set Per Page drop-down to 250
    Then Paging: Expect Total Number of Pages to be 3
    Then Toolbar: Expect number of orders on page to be correct
    Then Paging: Set Per Page drop-down to 100
    Then Paging: Expect Total Number of Pages to be 6
    Then Toolbar: Expect number of orders on page to be correct

    Then Sign out