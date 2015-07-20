@regression
Feature:  B-01636 Single Order Indicium Error

  Background:
    * I am signed in as a batch shipper

  @multi_order_indicium_error
  Scenario:  B-01636 Multi Order Indicium Error
    * Add new order
    * Set Recipient Address to B-01754-1, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Add a second order
    * Set Recipient Address to B-01636-2, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Service to Priority Mail Regional Rate Box A
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Expect Print Error 1 of 2 selected orders have errors and cannot be printed.  To print the remaining orders, click Continue.
    * Sign out
