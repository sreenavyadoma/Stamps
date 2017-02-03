
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given a valid user is signed in to Web Apps

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-To to Domestic Address
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then on Order Details form, set Length to 20
    Then on Order Details form, set Width to 35
    Then on Order Details form, set Height to 20
    Then on Order Details form, set Ounces to 2
    Then on Order Details form, set Pounds to 1
    Then Pause for 2 seconds
    Then on Order Details form, expect service Textbox is enabled
    Then Pause for 1 second
    Then Pause for 1 second
    Then on Order Details form, expect service "PM Package" is enabled
    Then Pause for 1 second
    Then on Order Details form, select service PM Package
    Then Pause for 2 seconds
    Then on Order Details form, expect Length is 0
    Then on Order Details form, expect Height is 0
    Then on Order Details form, expect Width is 0
    Then Sign out


