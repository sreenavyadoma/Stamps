
Feature:  Store Management - Add Amazon Store

  Background:
    Given I am signed in to Orders

    @store_management
    Scenario: Store Management - Add Amazon Store
      Then Open Manage Stores modal
      Then Open Add Store or Marketplace modal
      Then Marketplace modal - Select Amazon Store
      Then Amazon Store - Set Amazon Seller ID to A1BX1F0B3I9QDV
      Then Amazon Store - Set Amazon MWS Auth Token to amzn.mws.20a589f0-ccb4-ac6f-1289-5115163052f0
      Then Amazon Store - Click Verify Seller ID button
      Then Amazon Store - Set Order Source to Non-Amazon
      Then Amazon Store - Set Order Source to Amazon.com
      Then Amazon Store - Set Product Identifier to Use the ASIN
      Then Amazon Store - Set Product Identifier to Use SKU
      Then Amazon Store - Click Connect button
      Then Close Manage Stores modal
      Then Orders Grid: Sort by Store in Descending order
      Then Orders Grid: Sort by Store in Ascending order
      Then Orders Grid: Sort by Store in Ascending order
      Then Pause for 2 seconds
      Then Orders Grid: Expect Store row 1 to be Amazon Store

