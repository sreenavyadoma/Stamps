
Feature:  Address Management

  Background:
    Given a valid user is signed in to Web Apps

  @address_management
  Scenario: Address Management
    Then in Orders Toolbar, click Add button
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then on Manage Shipping Address modal, edit address for name = "Euan", company = "Betfair UK" and city = "San Francisco" to;
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city       | state      | zip    | country       | phone  |
      |90245          | Rob   | Stamps.com | 1990 E. Grand Ave. |                 | El Segundo | California | 90245  | United States | random |
    Then on Manage Shipping Address modal, delete Row 1 from Manage Shipping Addresses Modal
    Then on Manage Shipping Address modal, delete all addresses
    Then Sign out


