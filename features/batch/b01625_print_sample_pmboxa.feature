@regression
Feature: B-01625  Print Sample Priority Mail Regional Rate Box A

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Priority Mail Regional Rate Box A
    * Add new order
    * Set Recipient Address to B-01624, Regional Rate Box A, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Regional Rate Box A
    * Print Sample
    * Sign out

