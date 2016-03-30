Feature: Print: Print Sample - Priority Mail Flat Rate Envelope

  Background:
    Given I am signed in to Orders

  @print_sample_pm_flat_rate_envelope
  Scenario:  Priority Mail Flat Rate Envelope
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Open Print Modal
    Then Print: Set Printer to "factory"
    Then Print: Print Sample
    Then Sign out
