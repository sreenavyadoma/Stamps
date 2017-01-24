Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given A user is signed in to Orders

  @filter3
  Scenario: Print 3 orders
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service FCM Large Envelope

    Then In Orders Toolbar, click Add button second order
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service FCM Large Envelope

    Then In Orders Toolbar, click Add button third order
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service MM Package

    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2
    Then In Orders Grid, check row 3

    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button

    Then In left filter panel, expect all printed Order IDs not in Awaiting Shipment tab
    Then In left filter panel, expect all printed Order IDs are in Shipped tab
    Then Sign out

    #todo -rob