Feature: Sorting.

  Background:
    Given I am signed in to Orders

  @sort
  Scenario: Orders Grid Sorting

    Then Orders Grid: Order ID: Sort Ascending
    Then Orders Grid: Order ID: Sort Descending

    Then Orders Grid: Order Total: Sort Ascending
    Then Orders Grid: Order Total: Sort Descending

    Then Orders Grid: Ship Date: Sort Ascending
    Then Orders Grid: Ship Date: Sort Descending

    Then Orders Grid: Order Status: Sort Ascending
    Then Orders Grid: Order Status: Sort Descending

    Then Orders Grid: Insured Value: Sort Ascending
    Then Orders Grid: Insured Value: Sort Descending

    Then Orders Grid: Weight: Sort Ascending
    Then Orders Grid: Weight: Sort Descending

    Then Orders Grid: Item Name: Sort Ascending
    Then Orders Grid: Item Name: Sort Descending

    Then Orders Grid: Item SKU: Sort Ascending
    Then Orders Grid: Item SKU: Sort Descending

    Then Orders Grid: Qty: Sort Ascending
    Then Orders Grid: Qty: Sort Descending

    Then Orders Grid: Email: Sort Ascending
    Then Orders Grid: Email: Sort Descending

    Then Orders Grid: Phone: Sort Ascending
    Then Orders Grid: Phone: Sort Descending

    Then Orders Grid: Country: Sort Ascending
    Then Orders Grid: Country: Sort Descending

    Then Orders Grid: Zip: Sort Ascending
    Then Orders Grid: Zip: Sort Descending

    Then Orders Grid: State: Sort Ascending
    Then Orders Grid: State: Sort Descending

    Then Orders Grid: City: Sort Ascending
    Then Orders Grid: City: Sort Descending

    Then Orders Grid: Address: Sort Ascending
    Then Orders Grid: Address: Sort Descending

    Then Orders Grid: Company: Sort Ascending
    Then Orders Grid: Company: Sort Descending

    Then Orders Grid: Recipient: Sort Ascending
    Then Orders Grid: Recipient: Sort Descending

    Then Orders Grid: Order Date: Sort Ascending
    Then Orders Grid: Order Date: Sort Descending

    Then Orders Grid: Age: Sort Ascending
    Then Orders Grid: Age: Sort Descending

    #Then Orders Grid: Ship Cost: Sort Ascending
    #Then Orders Grid: Ship Cost: Sort Descending

    #Then Orders Grid: Tracking No.: Sort Ascending
    #Then Orders Grid: Tracking No.: Sort Descending

    #Then Orders Grid: Cost Code: Sort Ascending
    #Then Orders Grid: Cost Code: Sort Descending

    #Then Orders Grid: Reference No.: Sort Ascending
    #Then Orders Grid: Reference No.: Sort Descending

    #Then Orders Grid: Service: Sort Ascending
    #Then Orders Grid: Service: Sort Descending

    #Then Orders Grid: Ship From: Sort Ascending
    #Then Orders Grid: Ship From: Sort Descending



