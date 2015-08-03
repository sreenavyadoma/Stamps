@bvt
Feature:  BVT - Add New Order

  Background:
    * I am signed in as a batch shipper

  @bvt_add_new_order
  Scenario:  Add New Order
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Pounds to 1
    * Set Ounces to 1
    * Set Length to 1
    * Set Width to 1
    * Set Height to 1
    * Set Insured Value to $1.00
    * Set Service to Priority Mail Package
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Expect Pounds to be 1
    * Expect Ounces to be 1
    * Expect Weight to be 1 lbs. 1 oz.
    * Expect Insured Value to be $1.00
    * Sign out
