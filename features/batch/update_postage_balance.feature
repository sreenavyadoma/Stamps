@regression
Feature: B-01726 Update Postage Balance After Each Print

  @update_postage_balance
  Scenario: B-01726 Update Postage Balance After Each Print
    * I am signed in as a batch shipper
    * Add new order
    * Set Recipient Address to B-01726, Update Balance, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Print
    * Expect Printing cost is deducted from customer balance
    * Sign out
    * I am signed in as a batch shipper webbatch_0001/password1
    * Add new order
    * Set Recipient Address to B-01726, Update Balance, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Print
    * Expect Printing cost is deducted from customer balance
    * Sign out
    * I am signed in as a batch shipper
    * Add new order
    * Set Recipient Address to B-01726, Update Balance, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Print
    * Expect Printing cost is deducted from customer balance
    * Sign out
