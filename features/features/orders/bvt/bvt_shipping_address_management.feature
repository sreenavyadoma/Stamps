
Feature:  BVT Address Management

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_shipping_address_management
  Scenario: BVT Shipping Address
    Then add new order
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name  | company    | street_address     | street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then on Manage Shipping Address modal, expect selection has random
    Then on Manage Shipping Address modal, delete all addresses
    Then set Order Details form Ship-From to San Francisco, CA
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then Sign out
