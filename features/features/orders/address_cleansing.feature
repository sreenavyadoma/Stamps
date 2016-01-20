
Feature: Address Cleansing

  Background:
    Given I am signed in to Orders

  @address_cleansing
  Scenario: Address Cleansing
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to
      | name              | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Ambiguous Address | Address Cleansing | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Ounces to 1
    Then Order Details - Set Pounds to 1
    Then Order Details - Set Insure For to $200
    Then Pause for 2 seconds
    Then Expect Grid Zip to be 94102
    Then Expect Grid Recipient to be Ambiguous Address
    Then Expect Grid Company to be Address Cleansing
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA

    When Add New Order
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Priority Mail Package"
    And Hide Order Details Form Ship-To fields
    And Sign out

