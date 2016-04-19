Feature: Address Cleansing BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_address_cleansing
  Scenario: Address Cleansing
    Then Postage: Select Shipping Label 5 x 8
    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name              | company | street_address      | city          | state | zip    | country       |
      | Address Cleansing | BVT     | 1350 Market Street  | San Francisco | CA    |        | United States |
    Then Postage: Set Pounds to 0
    Then Postage: Set Ounces to 1
    Then Postage Shipping Labels: Set Service to Priority Mail Package
    Then Postage Shipping Labels: Expect Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102
    Then Sign out