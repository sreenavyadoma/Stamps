@regression
Feature: New Order ID Created

  Background:
    * I am signed in as a batch shipper

  Scenario:  New Order ID Created
    * Add new order
    * Expect new Order ID created
    * Sign out
