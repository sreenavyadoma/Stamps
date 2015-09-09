Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in as a batch shipper


  Scenario:
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    Then Set Service to First-Class Mail Large Envelope/Flat

    Then Edit row 1 on the order grid

    Then Print

    Then Expect all printed Order IDs does not exist in Awaiting Shipment tab
    Then Expect all printed Order IDs exist in Awaiting Shipment tab


    Scenario: 2


      And I Add a second order
      Then Set Ship From to default
      Then Set Ship-To address to random
      Then Set Service to First-Class Mail Large Envelope/Flat

      Then Edit row 2 on the order grid
