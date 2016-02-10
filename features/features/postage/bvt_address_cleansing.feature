Feature: Address Cleansing BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_address_cleansing
  Scenario: Address Cleansing

    Then Print Postage: Select Print On Shipping Label - 5 ½” x 8 ½”

    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip    | country       |
      | Mark Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |        | United States |

    Then Shipping Labels: Set Pounds to 0
    Then Shipping Labels: Set Ounces to 1
    Then Shipping Labels: Set Service to "Priority Mail Package"

    And Shipping Label: Expect Domestic Address field displays Mark Davidson, Company Name, 1350 Market Street, San Francisco, CA 94102

    And Sign out