
Feature:  B-01636 Prompt User to Remove Orders in Error from Print Group

  Background:
    * I am signed in as a batch shipper

  @print_selected_orders_have_errors @printing_errors
  Scenario:  Printing
    * Add new order
    * Set Ship From to default
    * Edit row 1 on the order grid
    * Edit row 2 on the order grid
    * Click Toolbar Print Button
    * Print expecting error All selected orders have errors and cannot be printed.
    * Sign out
