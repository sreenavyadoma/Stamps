Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in to Orders

  @filter3
  Scenario: Print 3 orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat

    Then Toolbar: Add second order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service First-Class Mail Large Envelope/Flat

    Then Toolbar: Add third order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service Media Mail Package/Flat/Thick Envelope

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print

    Then Left Panel: Expect all printed Order IDs not in Awaiting Shipment tab
    Then Left Panel: Expect all printed Order IDs are in Shipped tab
    Then Sign out

    #todo -rob