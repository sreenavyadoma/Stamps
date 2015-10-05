
Feature: Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @address_cleansing @regression
  Scenario: Address Cleansing
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | B-01603 | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Set single-order form Service to "Priority Mail Package"
    Then Expect order-grid Zip to be 94102
    Then Expect order-grid Recipient to be B-01603
    Then Expect order-grid Company to be Address Cleansing
    Then Expect order-grid City to be San Francisco
    Then Expect order-grid State to be CA
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Package"
    And Sign out

