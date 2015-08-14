@regression
Feature: B-01624 Print Priority Mail Express Medium Flat Rate Box

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print Priority Mail Express Medium Flat Rate Box
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Collapse Ship-To Address
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Print
    * Sign out

