
@orders_grid_tests
Feature: in Orders Grid, Tracking & Order Status

  Background:
    Given a valid user is signed in to Web Apps

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details ounces to 5
    Then set order details service to PM Flat Rate Envelope
    Then check order details insure-for checkbox
    Then set order details insure-for to $52.99
    Then pause for 1 second
    Then expect orders grid insured value is $52.99
    Then pause for 1 second
    Then uncheck order details insure-for checkbox
    Then set order details service to PM Package
    Then uncheck order details insure-for checkbox
    # Then set Order Details Tracking to Signature Required
    Then pause for 2 seconds
    Then expect orders grid insured value is $0.00
    Then pause for 1 second
    Then sign out

  @grid_order_status
  Scenario: Order Status
    Then add new order
    Then expect orders grid order status is Awaiting Shipment
    Then sign out

  @grid_ship_cost
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details ounces to 1
    Then set order details service to PM Small Flat Rate Box
    Then Expect Ship Cost equals Total amount
    Then sign out

  @grid_tracking
  Scenario: Tracking & Order Status
    Then add new order
    Then expect orders grid order status is Awaiting Shipment
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details ounces to 5
    Then set order details service to PM Large Package
    Then set Order Details Tracking to USPS Tracking
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    #Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect orders grid order status is Shipped
    Then sign out

