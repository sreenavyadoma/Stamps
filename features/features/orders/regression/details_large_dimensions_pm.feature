
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given a valid user is signed in to Web Apps

  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    * in Orders Toolbar, click Add button
    * set Order Details form Ship-To to random address in zone 8
    * set Order Details form Ounces to 2
    * set Order Details form Pounds to 1
    * on Order Details form, select service PM Package
    * expect Order Details form service is PM Package
    * set Order Details form Length to 20
    * set Order Details form Width to 35
    * set Order Details form Height to 20
    * on Order Details form, blur out
    * on Order Details form, blur out
    * expect Order Details form Dimensions are hidden
    * expect Order Details form service is an empty string
    * on Order Details form, select service PM Package
    * on Order Details form, blur out
    * set Order Details form Length to 1
    * set Order Details form Width to 1
    * set Order Details form Height to 1
    * Pause for 2 seconds
    * expect Order Details form service Textbox is enabled
    * Pause for 1 second
    * expect Order Details form service is PM Package
    * Pause for 1 second
    * expect Order Details form service "PM Package" is enabled
    * Pause for 1 second
    * on Order Details form, select service PM Package
    * Pause for 2 seconds
    * expect Order Details form Length is 1
    * expect Order Details form Height is 1
    * expect Order Details form Width is 1
    * Sign out

