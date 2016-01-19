
Feature:  Store Management - Add Amazon Store

  Background:
    Given I am signed in to Orders

    @amazon_store
    Scenario: Store Management - Add Amazon Store
      Then Open Manage Stores modal
      Then Open Add Store or Marketplace modal
      Then Select Amazon Store from Marketplace modal
      Then Set Amazon Store - Amazon Seller ID to A1BX1F0B3I9QDV
      Then Set Amazon Store - Amazon MWS Auth Token to amzn.mws.20a589f0-ccb4-ac6f-1289-5115163052f0
      Then Click Amazon Store Verify Seller ID button
      Then Set Amazon Store - Order Source to Non-Amazon
      Then Set Amazon Store - Order Source to Amazon.com
      Then Set Amazon Store - Product Identifier to Use the ASIN
      Then Set Amazon Store - Product Identifier to Use SKU
      Then Click Amazon Store Connect button
      Then Close Manage Stores modal

