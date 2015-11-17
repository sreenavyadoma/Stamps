Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in as batch shipper ff/webpost_0001/pass111

  @filter
  Scenario: Print 1 order
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "First-Class Mail Large Envelope/Flat"
    Then Edit row 1 on the order grid
    Then Print
    Then Expect printed Order ID is not in Awaiting Shipment tab
    Then Expect printed Order ID is in Shipped tab
    And Sign out

  @filter3
  Scenario: Print 3 orders
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "First-Class Mail Large Envelope/Flat"

    And I Add a second order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "First-Class Mail Large Envelope/Flat"

    And I Add a third order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Media Mail Package"

    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid

    Then Print

    Then Expect all printed Order IDs do not exist in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab
    And Sign out
