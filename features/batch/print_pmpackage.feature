@regression
Feature: B-01624 Print Priority Mail Package

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print Priority Mail Package
    * I am signed in as a batch shipper
    * Add new order
    * Set Recipient Address to B-01624, Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Print
    * Sign out
