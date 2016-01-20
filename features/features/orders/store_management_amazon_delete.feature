
Feature:  Store Management - Delete Amazon Store

  Background:
    Given I am signed in to Orders

  @store_management
  Scenario: Store Management - Add Amazon Store
    Then Open Manage Stores modal
    Then Open Add Store or Marketplace modal
    Then Select Amazon Store from Marketplace modal
    Then Set Amazon Store - Amazon Seller ID to A1BX1F0B3I9QDV
    Then Set Amazon Store - Amazon MWS Auth Token to amzn.mws.20a589f0-ccb4-ac6f-1289-5115163052f0
    Then Click Amazon Store Verify Seller ID button
    Then Click Amazon Store Connect button
    Then Delete Manage Stores Modal Row 1
    Then Close Manage Stores modal

