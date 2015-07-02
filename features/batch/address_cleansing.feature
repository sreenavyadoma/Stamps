@regression
Feature: B-01603 As a batch shipper, I want Stamps.com to verify that my delivery addresses are valid.

  Background:
    Given I am signed in as a batch shipper auto03/password1

  @address_cleansing
  Scenario: Address Cleansing
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect order-grid Zip Code to be 94102
    * Set Receipient partial address to;
      | name    | company                 | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Exact Address Not Found | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect "Exact Address Not Found" module to appear
    * Select row 2 from Exact Address Not Found module
    * Set Service to Priority Mail Package
    * Set Ounces to 1
    * Expect order-grid Recipient Name to be B-01603
    * Expect order-grid Company Name to be Address Cleansing
    * Expect order-grid Street Address to be 1390 Market Street Ste 702
    * Expect order-grid City to be San Francisco
    * Expect order-grid State to be CA
    * Expect order-grid Zip Code to be 94102
    * Expect order-grid Phone to be (415) 123-5555
    * Expect order-grid Email to be rtest@stamps.com
    * Expect order-grid Ounces to be 1
    * Set Recipient Complete Address to B-01603, Address Cleansing, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Sign out
