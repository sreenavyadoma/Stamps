@regression
Feature:  B-01630 Ship Date - Print 2 days from today

  Background:
    * I am signed in as a batch shipper

  @print_date_1 @ship_date
  Scenario:  Print 2 days from today
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Click Toolbar Print Button
    * Set Ship Date to 2 day from today
    * Print
