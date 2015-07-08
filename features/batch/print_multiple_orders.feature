@regression
Feature: B-01634 As a batch shipper, I want to be able to print postage for multiple orders

  Background:
    Given I am signed in as a batch shipper auto20/password1

  @print_multiple_orders
  Scenario:  Print 2 Orders

    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01634 Print1, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package

    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01634 Print2, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package

    * Edit row 1 in the order grid
    * Edit row 2 in the order grid
    * Print
    * Sign out