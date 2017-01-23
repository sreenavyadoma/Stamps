
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given I am signed in to Orders

  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    * Orders Toolbar: Add
    * Order Details: Set Ship-To to address in Zone 8
    * Order Details: Set Ounces to 2
    * Order Details: Set Pounds to 1
    * Order Details: Select Service PM Package
    * Order Details: Expect Service is PM Package
    * Order Details: Set Length to 20
    * Order Details: Set Width to 35
    * Order Details: Set Height to 20
    * Order Details: Blur out
    * Order Details: Blur out
    * Order Details: Expect Dimensions are hidden
    * Order Details: Expect Service is an empty string
    * Order Details: Select Service PM Package
    * Order Details: Blur out
    * Order Details: Set Length to 1
    * Order Details: Set Width to 1
    * Order Details: Set Height to 1
    * Order Details: Set Insure-For to $100.00
    * Pause for 2 seconds
    * Order Details: Expect Service Textbox is enabled
    * Pause for 1 second
    * Order Details: Expect Service is PM Package
    * Pause for 1 second
    * Order Details: Expect Service "PM Package" is enabled
    * Pause for 1 second
    * Order Details: Select Service PM Package
    * Pause for 2 seconds
    * Order Details: Expect Length is 1
    * Order Details: Expect Height is 1
    * Order Details: Expect Width is 1
    * Sign out

