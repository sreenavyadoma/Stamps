
Feature: Address Cleansing

  Background:
    Given I am signed in to Orders

  @address_cleansing
  Scenario: Address Cleansing
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to
      | name              | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Ambiguous Address | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Grid Zip to be 94102
    Then Expect Grid Recipient to be Ambiguous Address
    Then Expect Grid Company to be Address Cleansing
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    And I Add a new order
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Set Order Details Form Height to 1
    Then Set Order Details Form Width to 1
    Then Set Order Details Form Length to 1
    And Hide Order Details Form Ship-To fields
    And Sign out

