@regression
Feature: B-01634 As a batch shipper, I want to be able to print postage for multiple orders

  Background:
    Given I am signed in as a batch shipper

  @print_multiple_orders
  Scenario:  Print 2 Orders
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Hide Ship To text area
    * Set Service to Priority Mail Package

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Hide Ship To text area
    * Set Service to Priority Mail Package

    * Edit row 1 on the order grid
    * Edit row 2 on the order grid
    * Expect 2 orders selected
    * Print
    * Sign out