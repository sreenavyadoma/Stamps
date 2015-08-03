@regression
Feature: B-01625  Print Sample Parcel Select Large Package

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Parcel Select Large Package
    * Add new order
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Parcel Select Large Package
    * Print Sample
    * Sign out

