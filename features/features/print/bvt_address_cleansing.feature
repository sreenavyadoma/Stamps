Feature: Address Cleansing BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_address_cleansing
  Scenario: Address Cleansing

    Then Postage: Select Shipping Label 5 x 8

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Postage: Set Ship-To to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Mark Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |        | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"

    Then Shipping Label: Expect Domestic Address field displays Mark Davidson, Company Name, 1350 Market Street, San Francisco, CA 94102

    Then Sign out