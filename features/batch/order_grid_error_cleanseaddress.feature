@regression
Feature: Confirm CleanseAddress Error handling in Order Grid

  Background:
    Given I am signed in as a batch shipper

  @order_grid_error_cleanseaddress
  Scenario: B-01742 As a batch shipper, I want to be notified when an order in the grid has an address cleansing error
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01742 Confirm CleanseAddress Error handling in Order Grid, Priority Mail Package, 0000 E Grand Ave, AnyTown, CA, 00000
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Expect Empty Ship Cost field
    * Expect Error Icon in Order Grid
    * Hover over error icon in Order Grid
    * Expect Error detail display for CleanseAddress
    * Sign out
