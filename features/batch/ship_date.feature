@regression @ship_date
Feature:  B-01630 Ship Date

  Background:
    * I am signed in as a batch shipper

  Scenario:  Set Ship Date to today
    * Add new order
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date Picker to 0 day(s) from today
    * Expect Print Window Ship Date to be 0 day(s) from today
    * Print

  Scenario:  Set Ship Date to 1 day from today
    * Add new order
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date Picker to 1 day(s) from today
    * Expect Print Window Ship Date to be 1 day(s) from today
    * Print

  Scenario:  Set Ship Date to 1 day from today
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date Picker to 2 day(s) from today
    * Expect Print Window Ship Date to be 2 day(s) from today
    * Print

  Scenario:  Set Ship Date to 1 day from today
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date Picker to 3 day(s) from today
    * Expect Print Window Ship Date to be 3 day(s) from today
    * Print

