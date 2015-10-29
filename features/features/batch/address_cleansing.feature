
Feature: Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @address_cleansing
  Scenario: Address Cleansing
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to
      | name              | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Ambiguous Address | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Set single-order form Service to "Priority Mail Package"
    Then Expect order-grid Zip to be 94102
    Then Expect order-grid Recipient to be Ambiguous Address
    Then Expect order-grid Company to be Address Cleansing
    Then Expect order-grid City to be San Francisco
    Then Expect order-grid State to be CA
    And I Add a new order
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Height to 1
    Then Set single-order form Width to 1
    Then Set single-order form Length to 1
    And Hide single-order form Ship-To fields
    And Sign out

