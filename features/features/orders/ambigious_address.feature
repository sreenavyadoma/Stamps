@regression
Feature: Ambigious Address

  Background:
    Given I am signed in to Orders

  @ambigious_address
  Scenario: Exact Address Not Found
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Set Ship-To address to
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect "Exact Address Not Found" module to appear
    And Select row 1 from Exact Address Not Found module
    Then Order Details - Set Ounces to 1
    Then Order Details - Set Pounds to 1
    Then Order Details - Set Insure For to $200
    Then Expect Grid Recipient to be Hillary Clinton
    Then Expect Grid Company to be The White House
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 94102
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Package"
    And Sign out

