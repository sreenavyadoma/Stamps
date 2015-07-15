@regression
Feature: B-01625  Print Sample Parcel Select Large Package

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Parcel Select Large Package
    * Add new order
    * Expect new Order ID created
    * Set Recipient Address to B-01624, Parcel Large Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Click Ship To Less button
    * Set Service to Parcel Select Large Package
    * Print Sample
    * Sign out

