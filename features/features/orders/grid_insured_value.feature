
Feature: Orders Grid: Tracking & Order Status

  Background:
    Given I am signed in to Orders

  @grid_insured_value
  Scenario: Tracking & Order Status
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Ounces to 5
    Then Order Details: Set Insure For to $1.00
    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Open Print Modal
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    Then Filter Panel - Shipped
    Then Orders Grid: Expect Tracking Number is populated
    Then Orders Grid: Expect Order Status to be "Shipped"

    Then Sign out