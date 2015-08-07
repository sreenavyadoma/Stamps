@bvt
Feature:  BVT - Ambigious Address

  Background:
    * I am signed in as a batch shipper

  @bvt_ambigious_address
  Scenario: Ambigious Address
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Company Name | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect "Exact Address Not Found" module to appear
    * Select row 2 from Exact Address Not Found module
    * Set Service to Priority Mail Package
    * Expect Recipient Name to be Joseph Balancio
    * Expect Company Name to be Company Name
    * Expect City to be San Francisco
    * Expect State to be CA
    * Expect Zip Code to be 94102
    * Sign out
