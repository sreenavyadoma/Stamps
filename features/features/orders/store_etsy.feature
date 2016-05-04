Feature:  Etsy Store Management

  Background:
    Given I am signed in to Orders

  @amazon_store
  Scenario: ORDERSAUTO-75
    Then Manage Stores: Open Modal
    Then Manage Stores: Delete All Stores in Grid

    Then Manage Stores: Add

    Then Marketplace: Select Etsy
    Then Etsy Store: Set Etsy Username to StampsDC
    Then Etsy Store: Click Find My Shops button
    Then Etsy Store: Set Available Shops to ????
    Then Etsy Store: Connect
