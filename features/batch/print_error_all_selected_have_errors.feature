@regression
Feature:  B-01636 Prompt User to Remove Orders in Error from Print Group

  Background:
    * I am signed in as a batch shipper

  @print_selected_orders_have_errors @printing_errors
  Scenario:  Printing
    * Add new order
    * Add a second order
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print expecting error All selected orders have errors and cannot be printed.
    * Sign out
