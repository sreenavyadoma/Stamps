Feature: Total Cost of Multiple Orders

  Background:
    Given I am signed in to Orders

  @multiple_order_total_cost
  Scenario:  Total Cost Multiple Orders
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1


    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1

    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Ounces to 1

    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Orders Grid: Check row 3


    Then Order Details: Expect Multiple Order Total Cost is $17.25


