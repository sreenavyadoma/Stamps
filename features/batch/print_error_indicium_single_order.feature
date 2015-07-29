@regression
Feature:  B-01636 Single Order Indicium Error

  Background:
    * I am signed in as a batch shipper

  @single_order_indicium_error @printing_errors
  Scenario:  B-01636 Single Order Indicium Error
    * Add new order
    * Set Recipient Address to B-01636-1, Indicium Errors, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Edit row 1 in the order grid
    * Print expecting error Indicium Error
    * Sign out
