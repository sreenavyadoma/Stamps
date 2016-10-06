
Feature:  BVT Wonderment

  Background:
    Given I am signed in to Orders

  @wonderment_bvt
  Scenario:  Add a new order
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 5 through 8
    Then Details: Select Service Priority Mail Package
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1
    Then Details: Set Length to 1
    Then Details: Set Width to 1
    Then Details: Set Height to 1
    Then Details: Set Insure-For to $1.00
    Then Sign out