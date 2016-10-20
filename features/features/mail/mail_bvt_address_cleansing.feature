Feature: Address Cleansing BVT

  Background:
    Given I am signed in as Mail shipper

  @mail_bvt_address_cleansing
  Scenario: Address Cleansing
    Then Mail: Select Shipping Label 5 x 8
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail: Set Ship-To to
      | name              | company | street_address      | city          | state | zip    | country       |
      | Address Cleansing | BVT     | 1350 Market Street  | San Francisco | CA    |        | United States |
    Then Mail: Set Pounds to 0
    Then Mail: Set Ounces to 1
    Then Mail Shipping Labels: Set Service to Priority Mail Package
    Then Mail Shipping Labels: Expect Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102
    Then Sign out