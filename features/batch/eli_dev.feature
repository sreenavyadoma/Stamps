@regression
Feature:   B-01743 Show Cost of Order in Ship Cost Grid

  Background:
    * I am signed in as a batch shipper with credentials auto05/password1

  @order_grid_ship_cost
  Scenario:
    * Add new order
    * Expect new Order ID created
    * Set Receipient address to;
      | name                      | company           | street_address      | city          | state | zip   | country       | phone       |  email            |
      | B-01743 |Show Cost of Order in Ship Cost Grid | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set Phone to 415 794-4522
    * Set Email to mycoolemail@email.com
    * Set Service to Large Envelope/Flat
    * Sign out