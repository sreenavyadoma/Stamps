
Feature: Address Cleansing

  Background:
    Given I am signed in to Orders

  @address_cleansing
  Scenario: Address Cleansing
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name              | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Ambiguous Address | Address Cleansing | 1390 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Ounces to 1
    Then Details: Set Pounds to 1
    Then Details: Set Insure For to $200
    Then Pause for 2 seconds
    Then Grid: Expect Zip to be 94102
    Then Grid: Expect Recipient to be Ambiguous Address
    Then Grid: Expect Company to be Address Cleansing
    Then Grid: Expect City to be San Francisco
    Then Grid: Expect State to be CA

    Then Add New Order
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Hide Ship-To fields
    Then Sign out

