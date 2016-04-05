
Feature:  Update Order to ShipStation

  Background:
    Given I am signed in to Orders

  @update_orders_to_shipstation
  Scenario:  Update Order to ShipStation
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 5 through 8
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Insure For to $1.00
    Then Details: Set Tracking to "Signature Required"
    Then Grid: Expect Pounds to be 1
    Then Grid: Expect Ounces to be 1
    Then Grid: Expect Weight to be 1 lbs. 1 oz.
    Then Grid: Expect Insured Value to be $1.00

    #here's the shipstation part.
    Then Grid: Uncheck row 1
    Then Pause for 2 seconds
    # checking the order will make an api call that will populate order details with data from shipstation
    Then Grid: Check row 1
    Then Grid: Check row 1
    Then Pause for 3 seconds

    Then Grid: Expect Pounds to be 1
    Then Grid: Expect Ounces to be 1
    Then Grid: Expect Weight to be 1 lbs. 1 oz.
    Then Grid: Expect Insured Value to be $1.00

    Then Details: Expect Tracking to be "Signature Required"
    Then Details: Expect Service to be "Priority Mail Package"

    Then Details: Expect Pounds to be 1
    Then Details: Expect Ounces to be 1

    Then Details: Expect Length to be 1
    Then Details: Expect Width to be 1
    Then Details: Expect Height to be 1
    Then Sign out

