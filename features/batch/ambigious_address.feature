@regression
Feature: B-01604 Orders with an ambiguous address

  Background:
    Given I am signed in as a batch shipper

  @ambigious_address
  Scenario: Exact Address Not Found
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect "Exact Address Not Found" module to appear
    And Select row 1 from Exact Address Not Found module
    Then Expect Recipient Name to be Hillary Clinton
    Then Expect Company Name to be The White House
    Then Expect City to be San Francisco
    Then Expect State to be CA
    Then Expect Zip Code to be 94102
    And Collapse Ship-To Address
    Then Set Service to Priority Mail Package
    And Sign out

