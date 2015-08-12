
Feature:  B-01636 Multi Order Printing Error

  Background:
    * I am signed in as a batch shipper

  @multi_order_printing_error @printing_error
  Scenario:  B-01636 Multi Order Printing Error
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Add a second order
    * Set Ship-To address to random
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Edit row 1 on the order grid
    * Edit row 2 on the order grid
    * Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    * Sign out
