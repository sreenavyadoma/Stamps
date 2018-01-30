
@orders_grid_tests
Feature: in Orders Grid, Tracking & Order Status

  Background:
    Given a valid user is signed in to Web Apps

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 5
    Then set Order Details service to PM Flat Rate Envelope
    Then check order details insure-for checkbox
    Then set Order Details Insure-For to $52.99
    Then Pause for 1 second
    Then expect Orders Grid Insured Value is $52.99
    Then Pause for 1 second
    Then uncheck order details insure-for checkbox
    Then set Order Details service to PM Package
    Then uncheck order details insure-for checkbox
    # Then set Order Details Tracking to Signature Required
    Then Pause for 2 seconds
    Then expect Orders Grid Insured Value is $0.00
    Then Pause for 1 second
    Then Sign out

  @grid_order_status
  Scenario: Order Status
    Then add new order
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then Sign out

  @grid_ship_cost
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Small Flat Rate Box
    Then Expect Ship Cost equals Total amount
    Then Sign out

  @grid_tracking
  Scenario: Tracking & Order Status
    Then add new order
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details Ounces to 5
    Then set Order Details service to PM Large Package
    Then set Order Details Tracking to USPS Tracking
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
    #Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect Orders Grid Order Status is Shipped
    Then Sign out

