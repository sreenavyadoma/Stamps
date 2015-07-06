Feature:  B-01690 As a Batch Shipper, I want to be able to delete or modify a Ship From address.

  Background:
    Given I am signed in as a batch shipper

  @address_management
  Scenario Outline: Address Management
    * Add new order
    * Expect new Order ID created
    # Add new shipping address test
    * Add new Ship-From address;
      |ship_from_zip  | name          | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | B-01690 Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Delete all shipping addresses
    * Sign out

    Examples:
      |ship_from_zip  | name          | company             | street_address1    | street_address2 | city          | state         | zip    | country       | phone           |
      |94105          | Euan Davidson | B-01690 Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
