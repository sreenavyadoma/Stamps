
Feature: Address Cleansing

  Background:
    Given I am signed in to Orders

  @address_cleansing
  Scenario: Address Cleansing
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name              | company | street_address   | street_address_2 | city       | state | zip | country       |
      | Address Cleansing | No Zip  | 1990 E Grand Ave |                  | El Segundo | CA    |     | United States |

    Then Order Details: Select Service PM Package
    Then Order Details: Set Ounces to 1
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Insure-For to $200
    Then Pause for 2 seconds
    Then Orders Grid: Expect Zip is 90245
    Then Orders Grid: Expect Recipient is Address Cleansing
    Then Orders Grid: Expect Company is No Zip
    Then Orders Grid: Expect City is El Segundo
    Then Orders Grid: Expect State is CA

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Package
    Then Sign out

