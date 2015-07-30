@regression
Feature: New Order ID Created

  Background:
    * I am signed in as a batch shipper

  @order_id
  Scenario:  New Order ID Created
    * Add new order
    * Expect new Order ID created
    * Expect Single Order Form Order ID equals Grid order ID
    * Sign out
