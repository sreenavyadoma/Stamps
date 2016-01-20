@bvt
Feature:  BVT Address Cleansing

  Background:
    Given I am signed in to Orders

  @bvt_address_cleansing
  Scenario: Address Cleansing
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 1
    Then Order Details - Set Pounds to 1
    Then Order Details - Set Insure For to $200
    Then Pause for 2 seconds
    Then Expect Grid Recipient to be Euan Davidson
    Then Expect Grid Company to be Company Name
    Then Expect Grid Address to be 1350 Market Street
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 94102
    And Sign out

