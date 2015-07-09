Feature: B-01603 As a batch shipper, I want Stamps.com to verify that my delivery addresses are valid.

  Background:
    Given I am signed in as a batch shipper

  @address_cleansing
  Scenario: Address Cleansing
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Service to Priority Mail Package
    * Set Receipient address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect Zip Code to be 94102
    * Set Receipient partial address to;
      | name    | company                 | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Exact Address Not Found | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect "Exact Address Not Found" module to appear
    * Select row 2 from Exact Address Not Found module
    * Expect Recipient Name to be B-01603
    * Expect Company Name to be Address Cleansing
    * Expect City to be San Francisco
    * Expect State to be CA
    * Expect Zip Code to be 94102
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Set Recipient Complete Address to B-01603, Address Cleansing, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Sign out

