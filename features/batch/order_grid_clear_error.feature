@regression
Feature: Confirm New Error Override in Orders Grid

  Background:
    Given I am signed in as a batch shipper

  @order_grid_clear_error
  Scenario: B-01742 As a batch shipper, I want a an error to be cleared in the orders grid if I edit any field in the order.
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Pounds to 9999999999
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Expect Error Icon in Order Grid
    * Hover over error icon in Order Grid
    * Expect Error detail display for GetRates
    * Set Email to rtest@stamps.com
    * Expect error icon cleared
    * Sign out