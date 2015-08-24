@bvt
Feature:  BVT - Ambigious Address

  Background:
    Given I am signed in as a batch shipper

  @bvt_ambigious_address
  Scenario: Ambigious Address
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Company Name | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    And Select row 2 from Exact Address Not Found module
    Then Set Service to Priority Mail Package
    Then Expect Recipient Name to be Joseph Balancio
    Then Expect Company Name to be Company Name
    Then Expect City to be San Francisco
    Then Expect State to be CA
    Then Expect Zip Code to be 94102
    And Sign out
