
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given a valid user is signed in to Web Apps

  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    * in Orders Toolbar, click Add button
    * on Order Details form, set Ship-To to address in Zone 8
    * on Order Details form, set Ounces to 2
    * on Order Details form, set Pounds to 1
    * on Order Details form, select service PM Package
    * on Order Details form, expect service is PM Package
    * on Order Details form, set Length to 20
    * on Order Details form, set Width to 35
    * on Order Details form, set Height to 20
    * on Order Details form, Blur out
    * on Order Details form, Blur out
    * on Order Details form, expect Dimensions are hidden
    * on Order Details form, expect service is an empty string
    * on Order Details form, select service PM Package
    * on Order Details form, Blur out
    * on Order Details form, set Length to 1
    * on Order Details form, set Width to 1
    * on Order Details form, set Height to 1
    * on Order Details form, set Insure-For to $100.00
    * Pause for 2 seconds
    * on Order Details form, expect service Textbox is enabled
    * Pause for 1 second
    * on Order Details form, expect service is PM Package
    * Pause for 1 second
    * on Order Details form, expect service "PM Package" is enabled
    * Pause for 1 second
    * on Order Details form, select service PM Package
    * Pause for 2 seconds
    * on Order Details form, expect Length is 1
    * on Order Details form, expect Height is 1
    * on Order Details form, expect Width is 1
    * Sign out

