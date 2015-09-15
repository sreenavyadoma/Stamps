
Feature: Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @address_cleansing @regression
  Scenario: Address Cleansing
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Set Service to Priority Mail Package
    Then Expect Order Grid - Zip to be 94102
    Then Expect Order Grid - Recipient to be B-01603
    Then Expect Order Grid - Company to be Address Cleansing
    Then Expect Order Grid - City to be San Francisco
    Then Expect Order Grid - State to be CA
    Then Set Ship-To address to random
    And Click Ship-To Less link
    Then Set Service to Priority Mail Package
    And Sign out

