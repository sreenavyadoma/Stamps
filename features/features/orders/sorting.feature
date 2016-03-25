Feature: Sorting.

  Background:
    Given I am signed in to Orders

  @sort
  Scenario: Orders Grid Sorting

    #Then Grid: Order ID: Columns Menu: Check Reference No
    #Then Grid: Order ID: Columns Menu: Check Cost Code

    Then Grid: Order ID: Sort Ascending
    Then Grid: Order ID: Sort Descending

    Then Grid: Order Total: Sort Ascending
    Then Grid: Order Total: Sort Descending

    Then Grid: Ship Date: Sort Ascending
    Then Grid: Ship Date: Sort Descending

    Then Grid: Order Status: Sort Ascending
    Then Grid: Order Status: Sort Descending

    Then Grid: Insured Value: Sort Ascending
    Then Grid: Insured Value: Sort Descending

    Then Grid: Weight: Sort Ascending
    Then Grid: Weight: Sort Descending

    Then Grid: Item Name: Sort Ascending
    Then Grid: Item Name: Sort Descending

    Then Grid: Item SKU: Sort Ascending
    Then Grid: Item SKU: Sort Descending

    Then Grid: Qty: Sort Ascending
    Then Grid: Qty: Sort Descending

    Then Grid: Email: Sort Ascending
    Then Grid: Email: Sort Descending

    Then Grid: Phone: Sort Ascending
    Then Grid: Phone: Sort Descending

    Then Grid: Country: Sort Ascending
    Then Grid: Country: Sort Descending

    Then Grid: Zip: Sort Ascending
    Then Grid: Zip: Sort Descending

    Then Grid: State: Sort Ascending
    Then Grid: State: Sort Descending

    Then Grid: City: Sort Ascending
    Then Grid: City: Sort Descending

    Then Grid: Address: Sort Ascending
    Then Grid: Address: Sort Descending

    Then Grid: Company: Sort Ascending
    Then Grid: Company: Sort Descending

    Then Grid: Recipient: Sort Ascending
    Then Grid: Recipient: Sort Descending

    Then Grid: Order Date: Sort Ascending
    Then Grid: Order Date: Sort Descending

    Then Grid: Age: Sort Ascending
    Then Grid: Age: Sort Descending

    #Then Grid: Ship Cost: Sort Ascending
    #Then Grid: Ship Cost: Sort Descending

    #Then Grid: Tracking No.: Sort Ascending
    #Then Grid: Tracking No.: Sort Descending

    #Then Grid: Cost Code: Sort Ascending
    #Then Grid: Cost Code: Sort Descending

    #Then Grid: Reference No.: Sort Ascending
    #Then Grid: Reference No.: Sort Descending

    #Then Grid: Service: Sort Ascending
    #Then Grid: Service: Sort Descending

    #Then Grid: Ship From: Sort Ascending
    #Then Grid: Ship From: Sort Descending



