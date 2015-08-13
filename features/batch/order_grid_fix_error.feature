@regression
Feature: Confirm Print after Order Grid Error Fix

  Background:
    Given I am signed in as a batch shipper

  @order_grid_fix_error
  Scenario: B-01742 As a batch shipper, I want to be able to print an order when all errors in the order have been fixed.
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Pounds to 9999999999
    * Set Recipient Complete Address to B-01742 Confirm Print after Order Grid Error Fix, Priority Mail Package, 0000 E Grand Ave, AnyTown, CA, 00000
    * Click Ship To Less button
    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Empty Ship Cost field
    * Expect Error Icon in Order Grid
    * Set Pounds to 0
    * Set Recipient Complete Address to B-01742 Confirm Print after Order Grid Error Fix, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Expect error icon cleared
    * Expect Ship Cost to be $0.98
    * Print
    * Sign out