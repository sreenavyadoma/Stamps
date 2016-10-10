
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given I am signed in to Orders

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then Toolbar: Add
    Then Details: Set Ship-To to domestic address
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then Details: Set Length to 20
    Then Details: Set Width to 35
    Then Details: Set Height to 20
    Then Details: Set Insure-For to $100.00
    Then Details: Set Ounces to 2
    Then Details: Set Pounds to 1
    Then Pause for 2 seconds
    Then Details: Expect Service Textbox is enabled
    Then Pause for 1 second
    Then Pause for 1 second
    Then Details: Expect Service "Priority Mail Package" is enabled
    Then Pause for 1 second
    Then Details: Select Service Priority Mail Package
    Then Pause for 2 seconds
    Then Details: Expect Length is 0
    Then Details: Expect Height is 0
    Then Details: Expect Width is 0
    Then Sign out


