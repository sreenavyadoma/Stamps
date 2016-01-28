@bvt
Feature:  BVT Address Cleansing

  Background:
    Given I am signed in to Orders

  @bvt_address_cleansing
  Scenario: Address Cleansing
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Insure For to $200
    Then Pause for 2 seconds
    Then Orders Grid: Expect Recipient to be Euan Davidson
    Then Orders Grid: Expect Company to be Company Name
    Then Orders Grid: Expect Address to be 1350 Market Street
    Then Orders Grid: Expect City to be San Francisco
    Then Orders Grid: Expect State to be CA
    Then Orders Grid: Expect Zip to be 94102
    And Sign out

