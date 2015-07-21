@regression
Feature:  B-01636 Prompt User to Remove Orders in Error from Print Group

  Background:
    * I am signed in as a batch shipper

  @print_selected_orders_have_errors @printing_errors
  Scenario:  Printing
    * Add new order
    * Set Recipient Address to B-01754-1, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Add a second order
    * Set Recipient Address to B-01636-2, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print and expect error All selected orders have errors and cannot be printed.
    * Sign out
