@regression
Feature:  B-01756 I want to be able to print postage for multiple selected orders

  Background:
    * I am signed in as a batch shipper

  @print_window
  Scenario:  Printing
    * Add new order
    * Expect Print Window label to be "You have 1 labels ready to print"
    * Add new order
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Expect Print Window label to be "You have 2 labels ready to print"
    * Sign out
