Feature: Print: Print Sample - Priority Mail Express Padded Flat Rate Envelope

  Background:
    Given I am signed in to Orders

  @print_sample_pme_padded_flat_rate_envelope
  Scenario:  Priority Mail Express Padded Flat Rate Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to random address Between Zone 1 through 4
    Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print Sample
    Then Sign out