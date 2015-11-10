
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in as a batch shipper

  @update_orders_to_shipstation
  Scenario:  Add a new order
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    Then Set Order Form Pounds to 1
    Then Set Order Form Ounces to 1
    Then Set Order Form Length to 1
    Then Set Order Form Width to 1
    Then Set Order Form Height to 1
    Then Set Order Form Insured Value to $1.00
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Tracking to "Signature Required"
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00

    #here's the shipstation part.
    Then Uncheck row 1 on the order grid
    #click awaiting shipment tab a few times.
    Then Edit row 1 on the order grid
    # Verify pounds, ounces height width length from Order Form
    Then Expect Order Form Service to be "Priority Mail Package"
    Then Expect Order Form Tracking to be "Signature Required"
    And Sign out
