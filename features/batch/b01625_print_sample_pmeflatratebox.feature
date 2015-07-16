@regression
Feature: B-01625  Print Sample Priority Mail Express Medium Flat Rate Box

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Priority Mail Express Medium Flat Rate Box
    * Add new order
    * Set Recipient Address to B-01624, Express Medium Flat Rate Box, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Print Sample
    * Sign out

