@regression
Feature: B-01624 Print Priority Mail Flat Rate Envelope

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print Priority Mail Flat Rate Envelope
    * Add new order
    * Expect new Order ID created
    * Set Recipient Address to B-01624, Flat Rate Envelope, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Flat Rate Envelope
    * Print
    * Sign out
