
Feature:  BVT - Printing

  Background:
    * I am signed in as a batch shipper

  @bvt_printing
  Scenario:  Printing
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Print
    * Sign out
