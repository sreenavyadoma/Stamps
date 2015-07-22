@bvt
Feature:  BVT - Address Cleansing

  Background:
    * I am signed in as a batch shipper

  @bvt_address_cleansing
  Scenario: Address Cleansing
    * Add new order
    * Set Receipient address to;
      | name    | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect Zip Code to be 94102
    * Set Service to Priority Mail Package
    * Expect Recipient Name to be B-01603
    * Expect Company Name to be Company Name
    * Expect Street Address to be 1350 Market Street
    * Expect City to be San Francisco
    * Expect State to be CA
    * Expect Zip Code to be 94102
    * Sign out
