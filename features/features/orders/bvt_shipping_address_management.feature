
Feature:  BVT Address Management

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipping_address_management
  Scenario: BVT Shipping Address
    Then In Orders Toolbar, click Add button
    Then Ship-From: Add address
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then Ship-From: Expect selection has random
    Then Ship-From: Delete all addresses
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then Sign out
