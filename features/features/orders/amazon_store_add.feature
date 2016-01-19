
Feature:  Store Management - Add Amazon Store

  Background:
    Given I am signed in to Orders

    @amazon_store
    Scenario: Store Management - Add Amazon Store
      Then Select Toolbar Settings Menu Item Add/Edit Stores
      Then Add Amazon Store using Amazon Seller ID A1BX1F0B3I9QDV and MWS Auth Token amzn.mws.20a589f0-ccb4-ac6f-1289-5115163052f0

