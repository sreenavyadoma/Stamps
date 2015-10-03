Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in as a batch shipper ff/webpost_0001/pass111

  @filter @regression
  Scenario: Print 1 order
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "First-Class Mail Large Envelope/Flat"
    Then Edit row 1 on the order grid
    Then Print
    Then Expect printed Order ID does not exist in Awaiting Shipment tab
    Then Expect printed Order ID exists in Shipped tab

  @filter3
  Scenario: Print 3 orders
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "First-Class Mail Large Envelope/Flat"

    And I Add a second order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "First-Class Mail Large Envelope/Flat"

    And I Add a third order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to random
    Then Set single-order form Service to "Media Mail Package"

    Then Edit row 1 on the order grid
    Then Edit row 2 on the order grid
    Then Edit row 3 on the order grid

    Then Print

    Then Expect all printed Order IDs do not exist in Awaiting Shipment tab
    Then Expect all printed Order IDs exist in Shipped tab
