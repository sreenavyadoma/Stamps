
Feature:  Store Management - Reconnect Amazon Store

  Background:
    Given I am signed in to Orders

  @store_management
  Scenario: Store Management - Reconnect Amazon Store
    Then Manage Stores: Open Modal
    Then Manage Stores: Add
    Then Marketplace: Select amazon.com
    Then Amazon Store: Set Amazon Seller ID to A1BX1F0B3I9QDV
    Then Amazon Store: Set Amazon MWS Auth Token to amzn.mws.20a589f0-ccb4-ac6f-1289-5115163052f0
    Then Amazon Store: Click Verify Seller ID button
    Then Amazon Store: Connect for the first time expecting Amazon Settings modal
    Then Pause for 2 seconds
    Then Manage Stores: Delete Row 1
    Then Manage Stores: Close Modal

