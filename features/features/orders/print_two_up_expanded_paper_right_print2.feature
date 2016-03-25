Feature: Print 2 Domestic labels on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: Print 2 Domestic labels on 8.5x11 - right side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Details: Set Ounces to 1
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Details: Set Service to "Priority Mail Small Flat Rate Box"
    Then Details: Set Ounces to 3
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Toolbar: Print
    Then Sign out
