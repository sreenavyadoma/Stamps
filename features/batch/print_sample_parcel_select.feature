@regression
Feature: B-01625  Print Sample Parcel Select Large Package

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Parcel Select Large Package
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Hide Ship To text area
    * Open Print Modal
    * Set Service to Parcel Select Large Package
    * Print Sample
    * Sign out

