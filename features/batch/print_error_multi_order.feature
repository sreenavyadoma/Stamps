@regression
Feature:  B-01636 Multi Order Printing Error

  Background:
    * I am signed in as a batch shipper

  @multi_order_printing_error @printing_errors
  Scenario:  B-01636 Multi Order Printing Error
    * Add new order
    * Set Recipient Address to B-01754-1, Order Errors, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Set Phone to 4159833422
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Add a second order
    * Set Recipient Address to B-01636-2, Order Errors, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Set Phone to 4159833422
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    * Sign out
