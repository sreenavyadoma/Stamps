@bvt
Feature:  BVT Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @bvt_address_cleansing
  Scenario: Address Cleansing
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order sorm Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect order-grid Zip to be 94102
    Then Set single-order form Service to "Priority Mail Package"
    Then Expect order-grid Recipient to be Euan Davidson
    Then Expect order-grid Company to be Company Name
    Then Expect order-grid Address to be 1350 Market Street
    Then Expect order-grid City to be San Francisco
    Then Expect order-grid State to be CA
    Then Expect order-grid Zip to be 94102
    And Sign out

