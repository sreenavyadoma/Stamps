Feature: As a batch shipper, I want is able to Filter Panel - orders by status [B-01621]

  Background:
    Given A user is signed in to Orders

  Scenario: User Views Filter Panel - Panel Default
    * In left filter panel, expect system displays expanded filters panel
    * In left filter panel, select Shipped
    * In left filter panel, expect selected filter is Shipped
    * In Orders Toolbar,  Set Per Page drop-down to 500
    * In Orders Toolbar, expect number of orders on page is correct
    * Paging: Expect Total Number of Pages is 2
    * In Orders Toolbar,  Set Per Page drop-down to 250
    * Paging: Expect Total Number of Pages is 3
    * In Orders Toolbar, expect number of orders on page is correct
    * Paging: Set Per Page drop-down to 100
    * Paging: Expect Total Number of Pages is 6
    * In Orders Toolbar, expect number of orders on page is correct
    * Sign out