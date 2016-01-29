Feature:  B-01998 Reduce UpdateOrder Calls on Order Edit

  Background:
    Given I am signed in to Orders

  @edit_order
  Scenario: User edits an order

    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Ounces to 3
    Then Order Details: Set Pounds to 2
    Then Order Details: Set Insure For to $1.00
    Then Order Details: Set Height to 1
    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then UnOrders Grid: Check row 1
    Then Orders Grid: Check row 1
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Insure For to $11.00
    Then Order Details: Set Height to 2
    Then Order Details: Set Length to 3
    Then Order Details: Set Width to 4
    Then UnOrders Grid: Check row 1
    Then Orders Grid: Check row 1
    Then Order Details: Expect Service to be "Priority Mail Package"
    Then Orders Grid: Expect Ounces to be 2
    Then Orders Grid: Expect Pounds to be 1
    Then Orders Grid: Expect Insured Value to be $11.00
    And Sign out
