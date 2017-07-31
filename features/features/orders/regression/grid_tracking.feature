
Feature: in Orders Grid, Tracking & Order Status

  Background:
    Given a valid user is signed in to Web Apps

  @grid_tracking
  Scenario: Tracking & Order Status

    Then add new order
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PM Large Package
    Then set Order Details form Tracking to USPS Tracking
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Print modal Printer to "factory"
    Then click print modal print button
    Then click Filter Panel Shipped tab
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect Orders Grid Order Status is Shipped

    Then add new order
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 5
    Then set Order Details form service to PM Large Package
    Then set Order Details form Tracking to Signature Required
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Print modal Printer to "factory"
    Then click print modal print button
    Then click Filter Panel Shipped tab
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect Orders Grid Order Status is Shipped

    Then Sign out


