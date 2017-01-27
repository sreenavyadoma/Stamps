
Feature: Address Cleansing

  Background:
    Given a valid user is signed in to Web Apps

  @address_cleansing
  Scenario: Address Cleansing
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address
      | name              | company | street_address   | street_address_2 | city       | state | zip | country       |
      | Address Cleansing | No Zip  | 1990 E Grand Ave |                  | El Segundo | CA    |     | United States |
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Insure-For to $200
    Then Pause for 2 seconds
    Then In Orders Grid, expect Zip is 90245
    Then In Orders Grid, expect Recipient is Address Cleansing
    Then In Orders Grid, expect Company is No Zip
    Then In Orders Grid, expect City is El Segundo
    Then In Orders Grid, expect State is CA

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then Sign out
