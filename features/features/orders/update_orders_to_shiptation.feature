
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in to Orders

  @update_orders_to_shipstation
  Scenario:  Add a new order
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Length to 1
    Then Order Details: Set Width to 1
    Then Order Details: Set Height to 1
    Then Order Details: Set Insure For to $1.00
    Then Order Details: Set Tracking to "Signature Required"
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00

    #here's the shipstation part.
    Then UnOrders Grid: Check row 1
    #click awaiting shipment tab a few times.
    Then Orders Grid: Check row 1
    # Verify pounds, ounces height width length from Order Form
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Expect Order Details Tracking to be "Signature Required"
    And Sign out
