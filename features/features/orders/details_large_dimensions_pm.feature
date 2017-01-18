
Feature: Priority Mail and Large Dimensions
  Entering Dimensions too Large for Priority Mail Causes Dimensions to Vanish and be Stuck

  Background:
    Given I am signed in to Orders

  @details_large_dimensions_pm
  Scenario: Priority Mail and Large Dimensions
    * Toolbar: Add
    * Details: Set Ship-To to address in Zone 8
    * Details: Set Ounces to 2
    * Details: Set Pounds to 1
    * Details: Select Service PM Package
    * Details: Set Length to 20
    * Details: Set Width to 35
    * Details: Set Height to 20
    * Details: Blur out
    * Details: Blur out
    * Details: Expect Dimensions are hidden
    * Details: Expect Service to be an empty string
    * Details: Select Service PM Package
    * Details: Set Length to 1
    * Details: Set Width to 1
    * Details: Set Height to 1
    * Details: Set Insure-For to $100.00
    * Pause for 2 seconds
    * Details: Expect Service Textbox is enabled
    * Pause for 1 second
    * Details: Expect Service is PM Package
    * Pause for 1 second
    * Details: Expect Service "PM Package" is enabled
    * Pause for 1 second
    * Details: Select Service PM Package
    * Pause for 2 seconds
    * Details: Expect Length is 0
    * Details: Expect Height is 0
    * Details: Expect Width is 0
    * Sign out

