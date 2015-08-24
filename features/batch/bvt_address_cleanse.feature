@bvt
Feature:  BVT - Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @bvt_address_cleansing
  Scenario: Address Cleansing
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect Zip Code to be 94102
    Then Set Service to Priority Mail Package
    Then Expect Recipient Name to be Euan Davidson
    Then Expect Company Name to be Company Name
    Then Expect Street Address to be 1350 Market Street
    Then Expect City to be San Francisco
    Then Expect State to be CA
    Then Expect Zip Code to be 94102
    And Sign out
