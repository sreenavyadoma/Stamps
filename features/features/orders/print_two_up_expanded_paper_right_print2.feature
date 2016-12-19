Feature: Print 2 Domestic labels on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_paper_right_print2
  Scenario: Print 2 Domestic labels on 8.5x11 - right side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address PM LFR Envelope, 8.5x11 Right Side 2, 2775 Stark Dr., Willoughby Hills OH 44094-9113
    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Set Ounces to 1
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address PM SFR Box, 8.5x11 Right Side 1, 610 W Tefft St, Nipomo, CA 93444-9187
    Then Details: Select Service Priority Mail Small Flat Rate Box
    Then Details: Set Ounces to 3
    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Print: Expect right-side label selected
    Then Print: Print
    Then Sign out
