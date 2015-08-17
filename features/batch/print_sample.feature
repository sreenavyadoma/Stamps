  @regression
  Feature: B-01625  Print Sample Parcel Select Large Package

  Background:
    Given I am signed in as a batch shipper

  @print_sample
  Scenario:  Print Sample - Parcel Select Large Package

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Parcel Select Large Package
    * Collapse Ship-To Address
    * Open Print Modal
    * Print Sample

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Regional Rate Box A
    * Collapse Ship-To Address
    * Open Print Modal
    * Print Sample

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Collapse Ship-To Address
    * Open Print Modal
    * Print Sample

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Express Package
    * Collapse Ship-To Address
    * Open Print Modal
    * Print Sample

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Flat Rate Envelope
    * Collapse Ship-To Address
    * Open Print Modal
    * Print Sample

    * Sign out
