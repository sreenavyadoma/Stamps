@regression
Feature:  B-01630 Ship Date - Plus 1 day

  Background:
    * I am signed in as a batch shipper

  @print_date_1 @ship_date
  Scenario:  Plus 1 day from today
    * Add new order
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date to 1 day from today
    * Print
