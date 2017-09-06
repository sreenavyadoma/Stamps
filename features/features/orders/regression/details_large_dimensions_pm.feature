
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given a valid user is signed in to Web Apps

  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    * add new order
    * expect Order Details form service is an empty string
    * set Order Details form Ship-To to random address in zone 8
    * set Order Details form Ounces to 2
    * set Order Details form Pounds to 1
    * set Order Details form service to PM Package
    * expect Order Details form service is PM Package
    * set Order Details form Length to 20
    * set Order Details form Width to 35
    * set Order Details form Height to 20
    * blur out on Order Details form
    * blur out on Order Details form
    * expect Order Details form Dimensions are hidden
    * set Order Details form service to PM Package
    * blur out on Order Details form
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
    * set Order Details form service to PM Package
    * Pause for 2 seconds
    * expect Order Details form Length is 1
    * expect Order Details form Height is 1
    * expect Order Details form Width is 1
    * Sign out

