
Feature:  BVT Address Management

  Background:
    Given I am signed in to Orders

  @orders_bvt_shipping_address_management
  Scenario: Add and Delete Ship-From Address
    Then Toolbar: Add
    Then Add Ship-From address
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then Details: Expect Ship-From selection has random
    Then Details: Delete all Ship-From address
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Sign out
