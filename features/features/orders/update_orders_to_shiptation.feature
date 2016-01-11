
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in to Orders

  @update_orders_to_shipstation
  Scenario:  Add a new order
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 5 through 8
    Then Set Order Details Pounds to 1
    Then Set Order Details Ounces to 1
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Length to 1
    Then Set Order Details Width to 1
    Then Set Order Details Height to 1
    Then Set Order Details Insure For to $1.00
    Then Set Order Details Tracking to "Signature Required"
    Then Expect Grid Pounds to be 1
    Then Expect Grid Ounces to be 1
    Then Expect Grid Weight to be 1 lbs. 1 oz.
    Then Expect Grid Insured Value to be $1.00

    #here's the shipstation part.
    Then Uncheck Orders Grid row 1
    #click awaiting shipment tab a few times.
    Then Check Orders Grid row 1
    # Verify pounds, ounces height width length from Order Form
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Expect Order Details Tracking to be "Signature Required"
    And Sign out
