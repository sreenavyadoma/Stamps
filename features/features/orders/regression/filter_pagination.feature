Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given a valid user is signed in to Web Apps

  Scenario: User Views Filter Panel - Panel Default
    Then in left Filter Panel, expect system displays expanded filters panel
    Then select Filter Panel tab Shipped
    Then expect selected Filter is Shipped
    Then in Orders Toolbar, set Per Page drop-down to 500
    Then in Orders Toolbar, expect number of orders on page is correct
    Then Paging: Expect Total Number of Pages is 2
    Then in Orders Toolbar, set Per Page drop-down to 250
    Then Paging: Expect Total Number of Pages is 3
    Then in Orders Toolbar, expect number of orders on page is correct
    Then Paging: Set Per Page drop-down to 100
    Then Paging: Expect Total Number of Pages is 6
    Then in Orders Toolbar, expect number of orders on page is correct
    Then Sign out