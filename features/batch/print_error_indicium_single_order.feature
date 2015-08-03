@regression
Feature:  B-01636 Single Order Indicium Error

  Background:
    * I am signed in as a batch shipper

  @single_order_indicium_error @printing_errors
  Scenario:  B-01636 Single Order Indicium Error
    * Add new order
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Edit row 1 in the order grid
    * Print expecting error Indicium Error
    * Sign out
