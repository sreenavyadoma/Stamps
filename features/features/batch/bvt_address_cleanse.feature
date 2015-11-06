@bvt
Feature:  BVT Address Cleansing

  Background:
    Given I am signed in as a batch shipper

  @bvt_address_cleansing
  Scenario: Address Cleansing
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect Grid Zip to be 94102
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Grid Recipient to be Euan Davidson
    Then Expect Grid Company to be Company Name
    Then Expect Grid Address to be 1350 Market Street
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 94102
    And Sign out

