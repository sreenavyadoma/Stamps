@regression
Feature: B-01726 Update Postage Balance After Each Print

  Background:
    Given I am signed in as a batch shipper

  @update_postage_balance
  Scenario: B-01726 Update Postage Balance After Each Print
    * Add new order
    * Expect new Order ID created

    * Set Recipient Complete Address to B-01726, Update Postage Balance After Each Print, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Insured Value to $10.00
    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Ship Cost to be $3.18
    * Print
    * Expect $3.18 is deducted from customer balance if printing is successful
    * Expect Printing cost is deducted from customer balance
    * Sign out
