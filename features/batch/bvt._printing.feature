@bvt
Feature:  BVT - Shipping Address Management

  Background:
    * I am signed in as a batch shipper

  @bvt_add_new_order
  Scenario:  Add New Order
    * Add new order
    * Expect new Order ID created
    * Set Recipient Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Insured Value to $1.00
    * Set Service to Priority Mail Package
    * Print
    * Sign out
