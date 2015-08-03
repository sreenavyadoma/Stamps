@regression
Feature: B-01726-1 Update Postage Balance After Each Print (With Service, Insurance & Tracking)

  @update_postage_balance
  Scenario: Update Postage Balance After Each Print
    * I am signed in as a batch shipper
    * Add new order
    * Set Ship-To address to random
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Set Insured Value to $10.00
    * Set Tracking to USPS Tracking
    * Save Shipping Costs Data
    * Print
    * Expect Printing cost is deducted from customer balance
    * Sign out