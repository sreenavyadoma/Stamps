@bvt
Feature:  BVT Address Cleansing

  Background:
    Given I am signed in to Orders

  @bvt_address_cleansing
  Scenario: Address Cleansing
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Ounces to 1
    Then Set Order Details Pounds to 1
    Then Set Order Details Insure For to $200
    Then Pause for 2 seconds
    Then Expect Grid Recipient to be Euan Davidson
    Then Expect Grid Company to be Company Name
    Then Expect Grid Address to be 1350 Market Street
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 94102
    And Sign out

