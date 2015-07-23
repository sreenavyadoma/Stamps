@regression
Feature: B-01624 Print Priority Mail Express Medium Flat Rate Box

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print Priority Mail Express Medium Flat Rate Box

    * Add new order
    * Set Recipient Address to B-01624, Flat Rate Box, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Print
    * Sign out

