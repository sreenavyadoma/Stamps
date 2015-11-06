
Feature:  Address Management

  Background:
    Given I am signed in as a batch shipper

  @address_management
  Scenario: Address Management
    And I Add a new order
    And Add Ship-From address
      |ship_from_zip  | name   | company | street_address  | street_address2  | city       | state         | zip    | country       | phone           |
      |90245          | Joseph | B-01690 Betfair US| 530 K Street Unit 504 |               | San Diego | California    | 92101  | United States | (323) 123-5555  |
    And Edit Ship-From address for name = "Joseph", company = "B-01690 Betfair US" and city = "San Diego" to;
      |ship_from_zip  | name                  | company                     | street_address   | street_address2 | city       | state  | zip           | country         | phone           |
      |90245          | Euan  | B-01690 Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    And Delete Ship-From Row 1 from Manage Shipping Addresses Modal
    Then Delete all Ship-From address
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Phone to random
    Then Set Order Details Form Service to "Priority Mail Large Package"
    And Sign out
