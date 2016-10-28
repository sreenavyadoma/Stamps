
Feature:  BVT Address Management

  Background:
    Given I am signed in to Orders

  @bvt_shipping_address_management
  Scenario: BVT Shipping Address
    Then Toolbar: Add
    Then Ship-From: Add address
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then Ship-From: Expect selection has random
    Then Ship-From: Delete all addresses
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Sign out
