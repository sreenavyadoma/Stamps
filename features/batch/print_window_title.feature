@regression
Feature:  B-01756 I want to be able to print postage for multiple selected orders

  Background:
    * I am signed in as a batch shipper

  @print_window
  Scenario:  Printing
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Email to rtest@stamps.com
    * Set Phone to 4159833422
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Set Service to Priority Mail Regional Rate Box A
    * Click Toolbar Print Button
    * Expect Print Window title to be "You have 1 label ready to print"
    * Add a second order
    * Set Ship-To address to random
    * Set Email to rtest@stamps.com
    * Set Phone to 4159833422
    * Click Ship To Less button
    * Set Pounds to 1
    * Set Ounces to 1
    * Edit row 1 on the order grid
    * Edit row 2 on the order grid
    * Click Toolbar Print Button
    * Expect Print Window title to be "You have 2 labels ready to print"
    * Sign out
