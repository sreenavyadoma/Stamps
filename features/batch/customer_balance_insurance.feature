@regression
Feature: B-01726-2 Update Postage Balance After Each Print (With Insurance)

  @update_postage_balance
  Scenario: B-01726 Update Postage Balance After Each Print
    * I am signed in as a batch shipper
    * Add new order
    * Set Ship-To address to random
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Set Insured Value to $10.00
    * Save Shipping Costs Data
    * Print
    * Expect Printing cost is deducted from customer balance
    * Sign out