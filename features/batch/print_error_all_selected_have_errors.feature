
Feature:  B-01636 Prompt User to Remove Orders in Error from Print Group

  Background:
    * I am signed in as a batch shipper

  @printing_error
  Scenario:  Printing
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Edit row 1 on the order grid
    * Print expecting error A Service must be selected before printing.

    * Add new order
    * Set Ship From to default
    * Edit row 1 on the order grid
    * Edit row 2 on the order grid
    * Print expecting error All selected orders have errors and cannot be printed.

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Ounces to 1

    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Collapse Ship-To Address
    * Set Pounds to 1
    * Set Ounces to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Edit row 1 on the order grid
    * Edit row 2 on the order grid
    * Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    * Sign out
