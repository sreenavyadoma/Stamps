
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in to Orders

  @update_orders_to_shipstation
  Scenario:  Add a new order
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Pounds to 1
    Then Set Order Details Ounces to 1
    Then Set Order Details Length to 1
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Insured Value to $1.00
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Tracking to "Signature Required"
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00

    #here's the shipstation part.
    Then Uncheck row 1 on the order grid
    #click awaiting shipment tab a few times.
    Then Edit row 1 on the order grid
    # Verify pounds, ounces height width length from Order Form
    Then Expect Order Details Form Service to be "Priority Mail Package"
    Then Expect Order Details Form Tracking to be "Signature Required"
    And Sign out
