@regression
Feature: B-01603 Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @address_cleansing
  Scenario: Address Cleansing
    * Add new order
    * Expect new Order ID created
    * Set Service to Priority Mail Package
    * Set Receipient address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    * Expect Zip Code to be 94102
    * Expect Recipient Name to be B-01603
    * Expect Company Name to be Address Cleansing
    * Expect City to be San Francisco
    * Expect State to be CA
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Set Recipient Address to B-01603, Address Cleansing, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Sign out
