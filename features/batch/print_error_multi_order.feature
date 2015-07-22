@regression
Feature:  B-01636 Multi Order Indicium Error

  Background:
    * I am signed in as a batch shipper

  @multi_order_indicium_error @printing_errors
  Scenario:  B-01636 Multi Order Indicium Error
    * Add new order
    * Set Recipient Address to B-01754-1, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Print expecting rating error
    * Add a second order
    * Set Recipient Address to B-01636-2, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Service to Priority Mail Regional Rate Box A
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print expecting some orders can not be printed
    * Sign out
