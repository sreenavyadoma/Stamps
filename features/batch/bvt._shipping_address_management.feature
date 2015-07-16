@bvt
Feature:  BVT - Shipping Address Management

  Background:
    * I am signed in as a batch shipper

  @bvt_shipping_address_management
  Scenario: Shipping Address Management
    * Add new order
    * Expect new Order ID created
    * Add new Ship-From address;
      |ship_from_zip  | name          | company     | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan | Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Sign out
