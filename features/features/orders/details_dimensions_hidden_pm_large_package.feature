
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given a valid user is signed in to Web Apps

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-To to Domestic Address
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then set Order Details form Length to 20
    Then set Order Details form Width to 35
    Then set Order Details form Height to 20
    Then set Order Details form Ounces to 2
    Then set Order Details form Pounds to 1
    Then Pause for 2 seconds
    Then expect Order Details form service Textbox is enabled
    Then Pause for 1 second
    Then Pause for 1 second
    Then expect Order Details form service "PM Package" is enabled
    Then Pause for 1 second
    Then set Order Details form service to PM Package
    Then Pause for 2 seconds
    Then expect Order Details form Length is 0
    Then expect Order Details form Height is 0
    Then expect Order Details form Width is 0
    Then Sign out


