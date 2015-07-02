@regression
Feature:   B-01743 Show Cost of Order in Ship Cost Grid

  Background:
    * I am signed in as a batch shipper auto05/password1

  @order_grid_service_price
  Scenario:
    * Add new order
    * Expect new Order ID created
    * Set Service to Priority Mail Package
    * Expect Single Order Form Service Rate to be $4.34
    * Sign out