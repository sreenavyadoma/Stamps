@regression
Feature: B-01625  Print Sample Priority Mail Regional Rate Box A

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Priority Mail Regional Rate Box A
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Priority Mail Regional Rate Box A
    * Print Sample
    * Sign out

