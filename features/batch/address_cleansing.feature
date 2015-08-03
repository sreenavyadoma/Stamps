@regression
Feature: B-01603 Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @address_cleansing
  Scenario: Address Cleansing
    * Add new order
    * Set Ship-To address to;
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    * Set Service to Priority Mail Package
    * Expect Zip Code to be 94102
    * Expect Recipient Name to be B-01603
    * Expect Company Name to be Address Cleansing
    * Expect City to be San Francisco
    * Expect State to be CA
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Service to Priority Mail Package
    * Sign out

