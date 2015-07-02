@address_management
Feature:  B-01690 As a Batch Shipper, I want to be able to delete or modify a Ship From address.

  Background:
    Given I am signed in as a batch shipper


  @address_management
  Scenario: Address Management
    * Add new order
    * Expect new Order ID created
    # Add new shipping address test
    * Add new Ship-From address;
      |ship_from_zip  | name          | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | B-01690 Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Add new Ship-From address;
      |ship_from_zip  | name           | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Joseph Balancio | B-01690 Betfair UK  | 101 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    # Modify Shipping Address test
    * Add new Ship-From address;
      |ship_from_zip  | name    | company         | street_address1  | street_address2  | city       | state         | zip    | country       | phone           |
      |90245          | B-01690   | B-01690 Change Address  | 1990 E Grand Ave |                  | El Segundo | California    | 90245  | United States | (415) 123-5555  |
    * Edit Ship-From address for name = "B-01690", company = "B-01690 Change Address" and city = "El Segundo" to;
      |ship_from_zip  | name                  | company                     | street_address1   | street_address2 | city       | state  | zip           | country         | phone           |
      |90245          | B-01690 Name Changed  | Address Edited Successfully | 101 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Add new Ship-From address;
      |ship_from_zip  | name          | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | B-01690 Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Delete all shipping addresses
    * Set Recipient Complete Address to B-01690 Delete, Modify, Edit Ship-From Address, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Service to Priority Mail Large Package
    * Sign out
