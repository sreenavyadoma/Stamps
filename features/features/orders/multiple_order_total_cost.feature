Feature: Total Cost of Multiple Orders

  Background:
    Given I am signed in to Orders

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1


    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1

    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Set Pounds to 1
    Then Details: Set Ounces to 1

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3


    Then Details: Expect Multiple Order Total Cost is $17.25


