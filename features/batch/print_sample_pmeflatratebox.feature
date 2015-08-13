@regression
Feature: B-01625  Print Sample Priority Mail Express Medium Flat Rate Box

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Priority Mail Express Medium Flat Rate Box
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Hide Ship-To text area
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Print Sample
    * Sign out

