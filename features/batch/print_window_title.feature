@regression
Feature:  B-01756 I want to be able to print postage for multiple selected orders

  Background:
    * I am signed in as a batch shipper

  @print_window
  Scenario:  Printing
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Open Print Modal
    * Expect Print Window title to be "You have 1 label(s) ready to print"
    * Add new order
    * Set Ship-To address to random
    * Set Service to Priority Mail Package
    * Edit row 1 on the order grid
    * Edit row 2 on the order grid
    * Open Print Modal
    * Expect Print Window title to be "You have 2 label(s) ready to print"
    * Sign out
