
Feature: Address Cleansing

  Background:
    Given a valid user is signed in to Web Apps

  @address_cleansing
  Scenario: Address Cleansing
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Domestic address to
      | full_name              | company | street_address   | street_address_2 | city       | state | zip | country       |
      | Address Cleansing | No Zip  | 1990 E Grand Ave |                  | El Segundo | CA    |     | United States |
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then set Order Details form Pounds to 1
    Then Pause for 2 seconds
    Then expect Orders Grid Zip is 90245
    Then expect Orders Grid Recipient is Address Cleansing
    Then expect Orders Grid Company is No Zip
    Then expect Orders Grid City is El Segundo
    Then expect Orders Grid State is CA

    Then add new order
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then Sign out