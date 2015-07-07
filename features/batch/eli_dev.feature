Feature:   B-01743 Show Cost of Order in Ship Cost Grid

  Background:
    * I am signed in as a batch shipper

  @order_grid_service_price
  Scenario:
    * Add new order
    * Expect new Order ID created
    * Set Recipient Complete Address to B-01625 Print Sample, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Service to Priority Mail Package
    * Expect Service Cost to be $4.34
    * Set Insured Value to 50.00
    * Expect Insurance Cost to be $2.20
    * Expect Tracking Cost to be $0.00
    * Verify Single Order Form Total Amount
    * Sign out