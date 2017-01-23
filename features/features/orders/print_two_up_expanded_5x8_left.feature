Feature: Print 1 Domestic label on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_5x8_left
  Scenario: Print 1 Domestic label on 5.5x8.5 - left side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address PME MFR Box, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Set Ounces to 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select left-side label
    Then Print Modal: Expect left-side label selected
    Then Print Modal: Print
    Then Sign out
