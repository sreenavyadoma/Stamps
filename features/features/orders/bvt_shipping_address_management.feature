
Feature:  BVT Address Management

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipping_address_management
  Scenario: BVT Shipping Address
    Then in Orders Toolbar, click Add button
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then on Manage Shipping Address modal, expect selection has random
    Then on Manage Shipping Address modal, delete all addresses
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Package
    Then Sign out
