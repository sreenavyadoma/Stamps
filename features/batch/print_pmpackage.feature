@regression
Feature: B-01624 Print Priority Mail Package

  Background:
    Given I am signed in as a batch shipper

  @print
  Scenario:  Print Priority Mail Package
    * I am signed in as a batch shipper
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Collapse Ship-To Address
    * Set Service to Priority Mail Package
    * Print
    * Sign out
