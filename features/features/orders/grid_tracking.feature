
Feature: in Orders Grid, Tracking & Order Status

  Background:
    Given a valid user is signed in to Web Apps

  @grid_tracking
  Scenario: Tracking & Order Status

    Then in Orders Toolbar, click Add button
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 5
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Tracking to USPS Tracking
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then In left Filter Panel, select Shipped
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect Orders Grid Order Status is Shipped

    Then in Orders Toolbar, click Add button
    Then expect Orders Grid Order Status is Awaiting Shipment
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 5
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Tracking to Signature Required
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then In left Filter Panel, select Shipped
    #Then in Orders Grid, Sort Order ID in Descending Order
    Then expect Orders Grid Tracking Number is populated
    Then expect Orders Grid Order Status is Shipped

    Then Sign out


