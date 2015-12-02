@regression
Feature: Ambigious Address

  Background:
    Given I am signed in as a batch shipper

  @ambigious_address
  Scenario: Exact Address Not Found
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to
      | name            | company                 | street_address      | city          | state | zip   | country       | phone  |  email |
      | Hillary Clinton | The White House         | 1390 Market Street  | San Francisco | CA    | 94102 | United States |        |        |
    Then Expect "Exact Address Not Found" module to appear
    And Select row 1 from Exact Address Not Found module
    Then Expect Grid Recipient to be Hillary Clinton
    Then Expect Grid Company to be The White House
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 94102
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Service to "Priority Mail Package"
    And Sign out

