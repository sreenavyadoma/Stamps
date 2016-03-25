@bvt
Feature:  BVT Address Cleansing

  Background:
    Given I am signed in to Orders

  @bvt_address_cleansing
  Scenario: Address Cleansing
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 1
    Then Details: Set Pounds to 1
    Then Details: Set Insure For to $200
    Then Pause for 2 seconds
    Then Grid: Expect Recipient to be Euan Davidson
    Then Grid: Expect Company to be Company Name
    Then Grid: Expect Address to be 1350 Market Street
    Then Grid: Expect City to be San Francisco
    Then Grid: Expect State to be CA
    Then Grid: Expect Zip to be 94102
    Then Sign out

