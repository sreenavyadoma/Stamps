
Feature:  Address Management

  Background:
    Given I am signed in to Orders

  @orders_address_management
  Scenario: Address Management
    Then Toolbar: Add
    Then Add Ship-From address
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then Edit Ship-From address for name = "Euan", company = "Betfair UK" and city = "San Francisco" to;
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city       | state      | zip    | country       | phone  |
      |90245          | Rob   | Stamps.com | 1990 E. Grand Ave. |                 | El Segundo | California | 90245  | United States | random |
    Then Delete Ship-From Row 1 from Manage Shipping Addresses Modal
    Then Details: Delete all Ship-From address
    Then Sign out


