Feature: Print 1 Domestic label on 5.5x8.5 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 1 Domestic label on 5.5x8.5 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PME MFR Box, 5.5x8.5, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 5 ½" x 8 ½""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out
