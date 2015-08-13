@regression
Feature: Confirm GetRates Error handling in Order Grid

  Background:
    Given I am signed in as a batch shipper

  @order_grid_error_createindicium
  Scenario: B-01633 As a batch shipper, I want to be notified when an order in the grid has a createindicium error.
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Pounds to 9999999999
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Expect Empty Ship Cost field
    * Expect Error Icon in Order Grid
    * Hover over error icon in Order Grid
    * Expect Error detail display for GetRates
    * Open Print Window
    * Print Postage
    * Expect Generic Error modal
    * Close Error modal
    * Expect Empty Ship Cost field
    * Expect Error Icon in Order Grid
    * Hover over error icon in Order Grid
    * Expect Error detail display for CreateIndicium
    * Sign out