
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given A user is signed in to Orders

  @details_dimensions_hidden_pm_large_package
  Scenario: Priority Mail and Large Dimensions
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-To to Domestic Address
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | random | Domestic FPO | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |

    Then On Order Details form, set Length to 20
    Then On Order Details form, set Width to 35
    Then On Order Details form, set Height to 20
    Then On Order Details form, set Insure-For to $100.00
    Then On Order Details form, set Ounces to 2
    Then On Order Details form, set Pounds to 1
    Then Pause for 2 seconds
    Then On Order Details form, expect service Textbox is enabled
    Then Pause for 1 second
    Then Pause for 1 second
    Then On Order Details form, expect service "PM Package" is enabled
    Then Pause for 1 second
    Then On Order Details form, select service PM Package
    Then Pause for 2 seconds
    Then On Order Details form, expect Length is 0
    Then On Order Details form, expect Height is 0
    Then On Order Details form, expect Width is 0
    Then Sign out


