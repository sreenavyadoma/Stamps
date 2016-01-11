Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in to Orders as ff/webpost_0001/pass111

  @filter
  Scenario: Print 1 order
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "First-Class Mail Large Envelope/Flat"
    Then Check Orders Grid row 1
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Print
    Then Expect printed Order ID is not in Awaiting Shipment tab
    Then Expect printed Order ID is in Shipped tab
    And Sign out

  @filter3
  Scenario: Print 3 orders
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "First-Class Mail Large Envelope/Flat"

    And I Add a second order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "First-Class Mail Large Envelope/Flat"

    And I Add a third order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Media Mail Package"

    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3

    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Print

    Then Expect all printed Order IDs not in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab
    And Sign out

    #todo -rob