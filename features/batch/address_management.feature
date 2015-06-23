@regression
Feature:  B-01690 As a Batch Shipper, I want to be able to delete or modify a Ship From address.

  Background:
    Given I am signed in as a batch shipper

  @address_management
  Scenario: Address Management
    * Add a new order
    * Expect new Order ID created
    * Delete all shipping addresses
    # Add new shipping address test
    * Add new Ship-From address;
      |ship_from_zip  | name          | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | B-01690 Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Add new Ship-From address;
      |ship_from_zip  | name           | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Josph Balancio | B-01690 Betfair UK  | 101 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Delete all shipping addresses
    # Modify Shipping Address test
    * Add new Ship-From address;
      |ship_from_zip  | name    | company         | street_address1  | street_address2  | city       | state         | zip    | country       | phone           |
      |90245          | B-01690   | B-01690 Change Address  | 1990 E Grand Ave |                  | El Segundo | California    | 90245  | United States | (415) 123-5555  |
    * Change Shipping Info for address having name = "B-01690", company = "Change Address" and city = "El Segundo" to;
      |ship_from_zip  | name                  | company           | street_address1   | street_address2 | city       | state  | zip           | country         | phone           |
      |90245          | B-01690 Name Changed  | Address changed!  | 101 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Delete all shipping addresses
    * Add new Ship-From address;
      |ship_from_zip  | name          | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | B-01690 Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Delete all shipping addresses
    * Sign out
