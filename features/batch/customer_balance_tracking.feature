@regression
Feature: B-01726-4 Update Postage Balance After Each Print (With Tracking)

  @update_postage_balance @update_postage_balance_with_tracking
  Scenario: B-01726 Update Postage Balance After Each Print
    * I am signed in as a batch shipper
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Hide Ship To text area
    * Set Service to Priority Mail Package
    * Set Tracking to USPS Tracking
    * Save Shipping Costs Data
    * Print
    * Expect Printing cost is deducted from customer balance
    * Sign out