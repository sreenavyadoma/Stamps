
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given I am signed in to Orders

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-To to Domestic Address
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then Order Details: Set Length to 20
    Then Order Details: Set Width to 35
    Then Order Details: Set Height to 20
    Then Order Details: Set Insure-For to $100.00
    Then Order Details: Set Ounces to 2
    Then Order Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Order Details: Expect Service Textbox is enabled
    Then Pause for 1 second
    Then Pause for 1 second
    Then Order Details: Expect Service "PM Package" is enabled
    Then Pause for 1 second
    Then Order Details: Select Service PM Package
    Then Pause for 2 seconds
    Then Order Details: Expect Length is 0
    Then Order Details: Expect Height is 0
    Then Order Details: Expect Width is 0
    Then Sign out


