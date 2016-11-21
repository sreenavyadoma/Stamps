Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

  Scenario: User Views Filter Panel - Panel Default
    When Left Panel: Expect system displays expanded filters panel

    Then Left Panel: Select Shipped
    Then Left Panel: Expect system selects Shipped Filter Panel - and deselects the previous filter

    Then Toolbar:  Set Per Page drop-down to 500
    Then Toolbar: Expect number of orders on page is correct
    Then Paging: Expect Total Number of Pages is 2
    Then Toolbar:  Set Per Page drop-down to 250
    Then Paging: Expect Total Number of Pages is 3
    Then Toolbar: Expect number of orders on page is correct
    Then Paging: Set Per Page drop-down to 100
    Then Paging: Expect Total Number of Pages is 6
    Then Toolbar: Expect number of orders on page is correct

    Then Sign out