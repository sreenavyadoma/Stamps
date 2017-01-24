
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given A user is signed in to Orders

  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    * In Orders Toolbar, click Add button
    * On Order Details form, set Ship-To to address in Zone 8
    * On Order Details form, set Ounces to 2
    * On Order Details form, set Pounds to 1
    * On Order Details form, select service PM Package
    * On Order Details form, expect service is PM Package
    * On Order Details form, set Length to 20
    * On Order Details form, set Width to 35
    * On Order Details form, set Height to 20
    * On Order Details form, Blur out
    * On Order Details form, Blur out
    * On Order Details form, expect Dimensions are hidden
    * On Order Details form, expect service is an empty string
    * On Order Details form, select service PM Package
    * On Order Details form, Blur out
    * On Order Details form, set Length to 1
    * On Order Details form, set Width to 1
    * On Order Details form, set Height to 1
    * On Order Details form, set Insure-For to $100.00
    * Pause for 2 seconds
    * On Order Details form, expect service Textbox is enabled
    * Pause for 1 second
    * On Order Details form, expect service is PM Package
    * Pause for 1 second
    * On Order Details form, expect service "PM Package" is enabled
    * Pause for 1 second
    * On Order Details form, select service PM Package
    * Pause for 2 seconds
    * On Order Details form, expect Length is 1
    * On Order Details form, expect Height is 1
    * On Order Details form, expect Width is 1
    * Sign out

