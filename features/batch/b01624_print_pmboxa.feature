@regression
Feature: B-01624 Print Priority Mail Regional Rate Box A

  Background:
    Given I am signed in as a batch shipper

  @print_pmrrboxa
  Scenario:  Print Priority Mail Regional Rate Box A
    * Sign out
    * I am signed in as a batch shipper
    * Add new order
    * Set Recipient Address to B-01624, Regional Rate Box A, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Regional Rate Box A
    * Print
    * Sign out
