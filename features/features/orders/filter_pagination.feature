Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given I am signed in to Orders

  Scenario: User Views Filter Panel - Panel Default
    When Filter Panel: Expect system displays expanded filters panel

    Then Filter Panel: Select Shipped
    Then Filter Panel: Expect selected filter is Shipped

    Then Orders Toolbar:  Set Per Page drop-down to 500
    Then Orders Toolbar: Expect number of orders on page is correct
    Then Paging: Expect Total Number of Pages is 2
    Then Orders Toolbar:  Set Per Page drop-down to 250
    Then Paging: Expect Total Number of Pages is 3
    Then Orders Toolbar: Expect number of orders on page is correct
    Then Paging: Set Per Page drop-down to 100
    Then Paging: Expect Total Number of Pages is 6
    Then Orders Toolbar: Expect number of orders on page is correct

    Then Sign out