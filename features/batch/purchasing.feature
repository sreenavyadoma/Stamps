@regression
Feature: Purchasing

  Background:
    Given I am signed in as a batch shipper auto30/password1

  @purchasing
  Scenario: $10
    * Add new order
    * Set Recipient Address to B-01726, Update Balance, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 20
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Add new order
    * Set Recipient Address to B-01726, Update Balance, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 20
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Add new order
    * Set Recipient Address to B-01726, Update Balance, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to 20
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Buy $10 postage
    * Expect $10 is added to customer balance
    * Buy $25 postage
    * Expect $25 is added to customer balance
    * Buy $50 postage
    * Expect $50 is added to customer balance
    * Buy $100 postage
    * Expect $100 is added to customer balance
    * Buy $35 postage
    * Expect $35 is added to customer balance
    * Sign out






