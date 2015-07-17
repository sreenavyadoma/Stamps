
Feature:  B-01754 Prompt User to Remove Orders in Error from Print Group

  Background:
    * I am signed in as a batch shipper

  @order_errors
  Scenario:  Printing
    * Add new order
    * Set Recipient Address to B-01754 #1, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com

    * Add new order
    * Set Recipient Address to B-01754 #2, Order Errors, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print Multiple Orders with errors
    * Print
    * Sign out
