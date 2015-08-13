@regression
Feature: B-01604 Orders with an ambiguous address

  Background:
    Given I am signed in as a batch shipper

  @ambigious_address
  Scenario: Exact Address Not Found
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    * Expect "Exact Address Not Found" module to appear
    * Select row 1 from Exact Address Not Found module
    * Expect Recipient Name to be Hillary Clinton
    * Expect Company Name to be The White House
    * Expect City to be San Francisco
    * Expect State to be CA
    * Expect Zip Code to be 94102
    * Hide Ship-To text area
    * Set Service to Priority Mail Package
    * Sign out

