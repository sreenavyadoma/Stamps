@bvt
Feature:  BVT - Ambigious Address

  Background:
    * I am signed in as a batch shipper

  @bvt_ambigious_address
  Scenario: Ambigious Address
    * Add new order
    * Set Receipient partial address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Ambigious Cleansing | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect "Exact Address Not Found" module to appear
    * Select row 2 from Exact Address Not Found module
    * Set Service to Priority Mail Package
    * Set Ounces to 1
    * Expect Recipient Name to be B-01603
    * Expect Company Name to be Address Cleansing
    * Expect City to be San Francisco
    * Expect State to be CA
    * Expect Zip Code to be 94102
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Expect Ounces to be 1
    * Sign out
