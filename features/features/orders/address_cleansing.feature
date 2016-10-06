
Feature: Address Cleansing

  Background:
    Given I am signed in to Orders

  @address_cleansing
  Scenario: Address Cleansing
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To domestic address to
      | name              | company | street_address   | street_address_2 | city       | state | zip | country       | phone          |  email           |
      | Address Cleansing | No Zip  | 1990 E Grand Ave |                  | El Segundo | CA    |     | United States | (415) 123-5555 | rtest@stamps.com |

    Then Details: Select Service Priority Mail Package
    Then Details: Set Ounces to 1
    Then Details: Set Pounds to 1
    Then Details: Set Insure-For to $200
    Then Pause for 2 seconds
    Then Grid: Expect Zip to be 90245
    Then Grid: Expect Recipient to be Address Cleansing
    Then Grid: Expect Company to be No Zip
    Then Grid: Expect City to be El Segundo
    Then Grid: Expect State to be CA

    Then Toolbar: Add
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Package
    Then Details: Hide Ship-To fields
    Then Sign out

