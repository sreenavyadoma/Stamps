
Feature:  SAmazon Store -

  Background:
    Given I am signed in to Orders

    @amazon_store
    Scenario: Store Management - Amazon Store
      Then Manage Stores: Open Modal
      Then Manage Stores: Delete All Stores in Grid
      Then Pause for 2 seconds

      Then Manage Stores: Add

      Then Marketplace: Select amazon.com

      Then Amazon Store: Set Amazon Seller ID to A1BX1F0B3I9QDV
      Then Amazon Store: Set Amazon MWS Auth Token to amzn.mws.caa9355f-c8a9-768e-bf55-8b51e73b8f98
      Then Amazon Store: Click Verify Seller ID button
      Then Amazon Store: Set Order Source to Amazon.com
      Then Amazon Store: Set Product Identifier to Use SKU
      Then Amazon Store: Connect for the first time expecting Amazon Settings modal

      Then Amazon Settings: Set Store Nickname to random

      #Then Amazon Settings: Set Service Mapping 1, Requested Services random, Shipping Service First-Class Mail Postcard
      #Then Amazon Settings: Set Service Mapping 2, Requested Services random, Shipping Service Priority Mail Package
      #Then Amazon Settings: Set Service Mapping 3, Requested Services random, Shipping Service Priority Mail Small Flat Rate Box

      Then Amazon Settings: Check Automatically Import New Orders
      Then Amazon Settings: Save
      Then Pause for 1 seconds
      Then Toolbar: Regresh Orders

      #Then Pause for 1 seconds
      #Then Manage Stores: Select Store random
      #Then Manage Stores: Reconnect
      #Then Amazon Store: Connect

      Then Manage Stores: Select Store random
      Then Manage Stores: Delete
      Then Toolbar: Regresh Orders

      Then Manage Stores: Close Modal
      Then Pause for 1 seconds
      Then Sign out



