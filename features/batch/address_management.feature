@regression @bvt
Feature:  B-01690 As a Batch Shipper, I want to be able to delete or modify a Ship From address.

  Background:
    Given I am signed in as a batch shipper

  @address_management @bvt_address_management
  Scenario: Address Management
    * Add new order
    * Set Ship From to default
    * Set Ship-To address to random
    * Set Phone to (415) 123-5555
    * Set Service to Priority Mail Large Package
    * Add new Ship-From address;
      |ship_from_zip  | name   | company | street_address1  | street_address2  | city       | state         | zip    | country       | phone           |
      |90245          | Joseph | B-01690 Betfair US| 530 K Street Unit 504 |                  | San Diego | California    | 92101  | United States | (323) 123-5555  |
    * Edit Ship-From address for name = "Joseph", company = "B-01690 Betfair US" and city = "San Diego" to;
      |ship_from_zip  | name                  | company                     | street_address1   | street_address2 | city       | state  | zip           | country         | phone           |
      |90245          | Euan  | B-01690 Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
    * Delete Row 1
    * Sign out
