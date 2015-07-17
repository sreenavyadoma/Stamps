@regression
Feature:  B-01756 I want to be able to print postage for multiple selected orders

  Background:
    * I am signed in as a batch shipper

  @print_window
  Scenario:  Printing
    * Add new order
    * Set Recipient Address to B-01756, Multiple Order 1, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Insured Value to $1.00
    * Set Service to Priority Mail Package
    * Expect Print Window label to be "You have 1 labels ready to print"
    * Add new order
    * Set Recipient Address to B-01756, Multiple Order 2, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Insured Value to $1.00
    * Set Service to Priority Mail Package
    * Expect Print Window label to be "You have 1 labels ready to print"
    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Expect Print Window label to be "You have 2 labels ready to print"
    * Print
    * Sign out
