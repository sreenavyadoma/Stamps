@bvt
Feature:  BVT Ambigious Address

  Background:
    Given I am signed in as a batch shipper

  @bvt_ambigious_address
  Scenario: Ambigious Address
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To to ambiguous address
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Company Name | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    And Select row 2 from Exact Address Not Found module
    Then Set single-order form Service to "Priority Mail Package"
    Then Expect order-grid Recipient to be Joseph Balancio
    Then Expect order-grid Company to be Company Name
    Then Expect order-grid City to be San Francisco
    Then Expect order-grid State to be CA
    Then Expect order-grid Zip to be 94102
    And Sign out
