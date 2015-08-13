@regression
Feature: Confirm New Error Override in Order Grid

  Background:
    Given I am signed in as a batch shipper

  @order_grid_new_error_override
  Scenario: B-01742 As a batch shipper, I want a new error to override an old error in an order.
    * Add new order
    * Expect new Order ID created
    * Expect Empty Ship Cost field
    * Set Ship From to default
    * Set Pounds to 9999999999
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Expect Error Icon in Order Grid
    * Hover over error icon in Order Grid
    * Expect Error detail display for GetRates
    * Edit row 1 in the order grid
    * Set Recipient Complete Address to B-0742 Confirm New Error Override in Order Grid, Priority Mail Package, 0000 E Grand Ave, AnyTown, CA, 00000
    * Expect Error Icon in Order Grid
    * Hover over error icon in Order Grid
    * Expect Error detail display for CleanseAddress
    * Sign out
