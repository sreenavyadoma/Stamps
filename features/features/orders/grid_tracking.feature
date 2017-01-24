
Feature: In Orders Grid, Tracking & Order Status

  Background:
    Given A user is signed in to Orders

  @grid_tracking
  Scenario: Tracking & Order Status

    Then In Orders Toolbar, click Add button
    Then In Orders Grid, expect Order Status is Awaiting Shipment
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 5
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Tracking to USPS Tracking
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then In left filter panel, select Shipped
    #Then In Orders Grid, Sort Order ID in Descending Order
    Then In Orders Grid, expect Tracking Number is populated
    Then In Orders Grid, expect Order Status is Shipped

    Then In Orders Toolbar, click Add button
    Then In Orders Grid, expect Order Status is Awaiting Shipment
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 5
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Tracking to Signature Required
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then In left filter panel, select Shipped
    #Then In Orders Grid, Sort Order ID in Descending Order
    Then In Orders Grid, expect Tracking Number is populated
    Then In Orders Grid, expect Order Status is Shipped

    Then Sign out


