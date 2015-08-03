
Feature:  BVT - Printing

  Background:
    * I am signed in as a batch shipper

  @bvt_printing
  Scenario:  Printing
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Insured Value to $1.00
    * Set Service to Priority Mail Package
    * Print
    * Sign out
