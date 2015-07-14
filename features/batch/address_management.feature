@regression
Feature:  B-01690 As a Batch Shipper, I want to be able to delete or modify a Ship From address.

  Background:
    Given I am signed in as a batch shipper

  @address_management
  Scenario: Address Management
    * Add new order
    * Expect new Order ID created
    * Set Recipient Complete Address to B-01690, CRUD Ship-From Address, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Service to Priority Mail Large Package
    * Add new Ship-From address;
      |ship_from_zip  | name            | company                 | street_address1  | street_address2  | city       | state         | zip    | country       | phone           |
      |90245          | Joseph | B-01690 Stamps.com  | 1990 E Grand Ave |                  | El Segundo | California    | 90245  | United States | (415) 123-5555  |
    * Edit Ship-From address for name = "Joseph", company = "B-01690 Stamps.com" and city = "El Segundo" to;
      |ship_from_zip  | name                  | company                     | street_address1   | street_address2 | city       | state  | zip           | country         | phone           |
      |90245          | Euan  | B-01690 Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Delete Row 1
    * Sign out
