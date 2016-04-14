Feature: Print: Print Sample - Priority Mail Express Padded Flat Rate Envelope

  Background:
    Given I am signed in to Orders

  @print_sample_pme_padded_flat_rate_envelope
  Scenario:  Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printer to "factory"
    Then Print: Print Sample
    Then Sign out