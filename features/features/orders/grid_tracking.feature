
Feature: Grid: Tracking & Order Status

  Background:
    Given I am signed in to Orders

  @grid_tracking
  Scenario: Tracking & Order Status
    Then Toolbar: Add
    Then Grid: Expect Order Status to be Awaiting Shipment
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 5
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Tracking to "USPS Tracking"
    Then Print: Open Modal
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Order ID: Sort Descending
    Then Grid: Expect Tracking Number is populated
    Then Grid: Expect Order Status to be Shipped

    Then Toolbar: Add
    Then Grid: Expect Order Status to be Awaiting Shipment
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Ounces to 5
    Then Details: Select Service Priority Mail Large Package
    Then Details: Set Tracking to "Signature Required"
    Then Print: Open Modal
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Filter: Select Shipped
    Then Grid: Order ID: Sort Descending
    Then Grid: Expect Tracking Number is populated
    Then Grid: Expect Order Status to be Shipped

    Then Sign out