
Feature:  Store Management - Reconnect Amazon Store

  Background:
    Given I am signed in to Orders

  @store_management
  Scenario: Store Management - Reconnect Amazon Store
    Then Open Manage Stores modal
    Then Open Add Store or Marketplace modal
    Then Marketplace modal - Select Amazon Store
    Then Amazon Store - Set Amazon Seller ID to A1BX1F0B3I9QDV
    Then Amazon Store - Set Amazon MWS Auth Token to amzn.mws.20a589f0-ccb4-ac6f-1289-5115163052f0
    Then Amazon Store - Click Verify Seller ID button
    Then Amazon Store - Click Connect button
    Then Pause for 2 seconds
    Then Delete Manage Stores Modal Row 1
    Then Close Manage Stores modal

