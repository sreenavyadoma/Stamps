@regression
Feature: B-01624 Print Priority Mail Regional Rate Box A

  Background:
    Given I am signed in as a batch shipper

  @print_pmrrboxa @print
  Scenario:  Print Priority Mail Regional Rate Box A
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Hide Ship To text area
    * Set Service to Priority Mail Regional Rate Box A
    * Print
    * Sign out
