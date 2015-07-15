@regression
Feature: B-01625  Print Sample Priority Mail Package

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Priority Mail Package
    * Add new order
    * Expect new Order ID created
    * Add new order
    * Expect new Order ID created
    * Set Recipient Complete Address to B-01624, Print Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Print Sample
    * Sign out

